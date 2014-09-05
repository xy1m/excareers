package com.fatface.util;

import java.io.InputStream;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.json.JSONException;

import com.qiniu.api.auth.AuthException;
import com.qiniu.api.auth.digest.Mac;
import com.qiniu.api.config.Config;
import com.qiniu.api.io.IoApi;
import com.qiniu.api.io.PutExtra;
import com.qiniu.api.io.PutRet;
import com.qiniu.api.rs.PutPolicy;

/**
 * @company: 搜狐

 * @author: zhenpengzhang
 
 * @createtime: 2014年9月5日 下午3:04:37

 * @version:
 
 */
public class QiniuFileUtils {
    private static Logger       logger     = Logger.getLogger(QiniuFileUtils.class);
    private final static String BUCKETNAME = "resignwall";
    private final static String SPACE      = "http://resignwall.qiniudn.com";

    public static String upload(String key, InputStream stream) {
        Config.ACCESS_KEY = "NqkJ-3cd_UymsS0rL5lm8N1ry0eK5V7izbODDWoS";
        Config.SECRET_KEY = "biGftAlesZDPa7QSNQjLXOh8umnJIRKGvuiWxc3q";
        Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);
        PutPolicy putPolicy = new PutPolicy(BUCKETNAME);
        String uptoken = StringUtils.EMPTY;
        try {
            uptoken = putPolicy.token(mac);
            PutExtra extra = new PutExtra();
            PutRet ret = IoApi.Put(uptoken, key, stream, extra);
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
