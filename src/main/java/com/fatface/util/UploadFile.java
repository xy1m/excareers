package com.fatface.util;

import com.qiniu.api.auth.digest.Mac;
import com.qiniu.api.config.Config;
import com.qiniu.api.io.IoApi;
import com.qiniu.api.io.PutExtra;
import com.qiniu.api.io.PutRet;
import com.qiniu.api.rs.PutPolicy;

public class UploadFile {

    public static void main(String[] args) throws Exception {
        Config.ACCESS_KEY = "NqkJ-3cd_UymsS0rL5lm8N1ry0eK5V7izbODDWoS";
        Config.SECRET_KEY = "biGftAlesZDPa7QSNQjLXOh8umnJIRKGvuiWxc3q";
        Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);
        // 请确保该bucket已经存在
        String bucketName = "resignwall";
        PutPolicy putPolicy = new PutPolicy(bucketName);
        String uptoken = putPolicy.token(mac);
        PutExtra extra = new PutExtra();
        String key = "李伟-搜狐-116627";
        String localFile = "D:/liwei.jpg";
        PutRet ret = IoApi.putFile(uptoken, key, localFile, extra);
        System.out.println(ret.getResponse());
    }
}