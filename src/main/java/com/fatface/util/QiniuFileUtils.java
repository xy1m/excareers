package com.fatface.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.Map;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.AbstractContentBody;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.json.JSONException;

import com.qiniu.api.auth.AuthException;
import com.qiniu.api.auth.digest.Mac;
import com.qiniu.api.config.Config;
import com.qiniu.api.io.IoApi;
import com.qiniu.api.io.PutExtra;
import com.qiniu.api.io.PutRet;
import com.qiniu.api.net.CallRet;
import com.qiniu.api.rs.PutPolicy;

public class QiniuFileUtils {

    private static Logger       logger       = Logger.getLogger(QiniuFileUtils.class);

    public static final int     NO_CRC32     = 0;
    private final static String HEADER_AGENT = "User-Agent";
    private final static String BUCKETNAME   = "resignwall";

    private final static String SPACE        = "http://resignwall.qiniudn.com";

    public static PutRet toPutFile(String uptoken, String key, InputStream reader, PutExtra extra) {
        File file = null;
        try {
            file = copyToTmpFile(reader);
            return put(uptoken, key, file, extra);
        } finally {
            if (file != null) {
                try {
                    file.delete();
                } catch (Exception e) {
                }
            }
        }
    }

    private static File copyToTmpFile(InputStream from) {
        FileOutputStream os = null;
        try {
            File to = File.createTempFile("qiniu_", ".tmp");
            os = new FileOutputStream(to);
            byte[] b = new byte[64 * 1024];
            int l;
            while ((l = from.read(b)) != -1) {
                os.write(b, 0, l);
            }
            os.flush();
            return to;
        } catch (Exception e) {
            throw new RuntimeException("create tmp file failed.", e);
        } finally {
            if (os != null) {
                try {
                    os.close();
                } catch (Exception e) {
                }
            }
            if (from != null) {
                try {
                    from.close();
                } catch (Exception e) {
                }
            }
        }
    }

    private static PutRet put(String uptoken, String key, File file, PutExtra extra) {

        if (!file.exists() || !file.canRead()) {
            return new PutRet(new CallRet(Config.ERROR_CODE, new Exception(
                "File does not exist or not readable.")));
        }
        extra = extra == null ? new PutExtra() : extra;
        MultipartEntity requestEntity = new MultipartEntity();
        try {
            requestEntity.addPart("token", new StringBody(uptoken));
            AbstractContentBody fileBody = buildFileBody(file, extra);
            requestEntity.addPart("file", fileBody);
            setKey(requestEntity, key);
            setParam(requestEntity, extra.params);
            if (extra.checkCrc != NO_CRC32) {
                if (extra.crc32 == 0) {
                    return new PutRet(new CallRet(Config.ERROR_CODE, new Exception(
                        "no crc32 specified!")));
                }
                requestEntity.addPart("crc32", new StringBody(extra.crc32 + ""));
            }

            if (extra.params != null) {
                for (Map.Entry<String, String> xvar : extra.params.entrySet()) {
                    requestEntity.addPart(xvar.getKey(),
                        new StringBody(xvar.getValue(), Charset.forName(Config.CHARSET)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new PutRet(new CallRet(Config.ERROR_CODE, e));
        }

        String url = Config.UP_HOST;

        CallRet ret = callWithMultiPart(url, requestEntity);

        return new PutRet(ret);
    }

    private static CallRet callWithMultiPart(String url, MultipartEntity requestEntity) {
        HttpClient client = new DefaultHttpClient();
        HttpPost postMethod = new HttpPost(url);
        postMethod.setEntity(requestEntity);

        postMethod.setHeader(HEADER_AGENT, getUserAgent());
        postMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
            new DefaultHttpMethodRetryHandler());
        postMethod.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
        client.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT,
            Config.CONNECTION_TIMEOUT);
        client.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, Config.SO_TIMEOUT);

        try {
            HttpResponse response = client.execute(postMethod);
            return handleResult(response);
        } catch (Exception e) {
            e.printStackTrace();
            return new CallRet(Config.ERROR_CODE, e);
        } finally {
            client.getConnectionManager().shutdown();
        }
    }

    private static String getUserAgent() {
        String javaVersion = "Java/" + System.getProperty("java.version");
        String os = System.getProperty("os.name") + " " + System.getProperty("os.arch") + " "
                    + System.getProperty("os.version");
        String sdk = "QiniuJava/" + Config.VERSION;
        return sdk + " (" + os + ") " + javaVersion;
    }

    private static CallRet handleResult(HttpResponse response) {
        if (response == null || response.getStatusLine() == null) {
            return new CallRet(Config.ERROR_CODE, "No response");
        }

        String responseBody;
        try {
            responseBody = EntityUtils.toString(response.getEntity(), "UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
            return new CallRet(Config.ERROR_CODE, e);
        }

        StatusLine status = response.getStatusLine();
        int statusCode = (status == null) ? Config.ERROR_CODE : status.getStatusCode();
        return new CallRet(statusCode, responseBody);
    }

    private static FileBody buildFileBody(File file, PutExtra extra) {
        if (extra.mimeType != null) {
            return new FileBody(file, extra.mimeType);
        } else {
            return new FileBody(file);
        }
    }

    private static void setKey(MultipartEntity requestEntity, String key)
                                                                         throws UnsupportedEncodingException {
        if (key != null) {
            requestEntity.addPart("key", new StringBody(key, Charset.forName(Config.CHARSET)));
        }
    }

    private static void setParam(MultipartEntity requestEntity, Map<String, String> params)
                                                                                           throws UnsupportedEncodingException {
        if (params == null) {
            return;
        }
        for (String name : params.keySet()) {
            requestEntity.addPart(name,
                new StringBody(params.get(name), Charset.forName(Config.CHARSET)));
        }
    }

    // 本地开发有效，七牛使用httpclient 4.2版本以上
    public static String upload(String key, InputStream stream) {
        Config.ACCESS_KEY = "NqkJ-3cd_UymsS0rL5lm8N1ry0eK5V7izbODDWoS";
        Config.SECRET_KEY = "biGftAlesZDPa7QSNQjLXOh8umnJIRKGvuiWxc3q";
        Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);
        // 请确保该bucket已经存在
        PutPolicy putPolicy = new PutPolicy(BUCKETNAME);
        String uptoken = StringUtils.EMPTY;
        try {
            uptoken = putPolicy.token(mac);
            PutExtra extra = new PutExtra();
            //PutRet ret = IoApi.Put(uptoken, key, stream, extra);
            PutRet ret = toPutFile(uptoken, key, stream, extra);
            return SPACE + "/" + ret.getKey();
        } catch (AuthException e) {
            logger.error("授权错误", e);
        } catch (JSONException e) {
            logger.error("JSON格式错误", e);
        }
        return null;
    }

    public static void main(String[] args) throws Exception {
        Config.ACCESS_KEY = "NqkJ-3cd_UymsS0rL5lm8N1ry0eK5V7izbODDWoS";
        Config.SECRET_KEY = "biGftAlesZDPa7QSNQjLXOh8umnJIRKGvuiWxc3q";
        Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);
        // 请确保该bucket已经存在
        String bucketName = "resignwall";
        PutPolicy putPolicy = new PutPolicy(bucketName);
        String uptoken = putPolicy.token(mac);
        PutExtra extra = new PutExtra();
        String key = "张振鹏";
        String localFile = "D:/zhangzhenpeng.jpg";
        PutRet ret = IoApi.putFile(uptoken, key, localFile, extra);
        System.out.println(ret.getKey());
    }
}