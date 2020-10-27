package com.hzh.utils;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;

public class AliyunSendSmsUtils {
    public static Integer getRandomCode(){
        Integer random = (int)(Math.random() * 9000 + 1000);
        System.out.println("random = " + random);
        return random;
    }

    public static Object sendSms(String phone,Integer verifycode){
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAI4G2p4DgtbLYgYswqyKHc", "C6o4V9h8b4qzBTkkJaPnboUnaVxfvb");
        IAcsClient client = new DefaultAcsClient(profile);

        CommonRequest request = new CommonRequest();
        request.setSysMethod(MethodType.POST);
        request.setSysDomain("dysmsapi.aliyuncs.com");
        request.setSysVersion("2017-05-25");
        request.setSysAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", phone);
        request.putQueryParameter("SignName", "ting域系统");
        request.putQueryParameter("TemplateCode", "SMS_204760980");
        request.putQueryParameter("TemplateParam", "{\"code\":\"" + verifycode + "\"}");
        try {
            CommonResponse response = client.getCommonResponse(request);
            String data = response.getData();
            System.out.println(data);
            return data;
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        AliyunSendSmsUtils.sendSms("13049150572",AliyunSendSmsUtils.getRandomCode());
//        for (int i = 0; i < 10; i++) {
//            System.out.println("getRandomCode() = " + getRandomCode());
//        }
//        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAI4G2p4DgtbLYgYswqyKHc", "C6o4V9h8b4qzBTkkJaPnboUnaVxfvb");
//        IAcsClient client = new DefaultAcsClient(profile);
//
//        CommonRequest request = new CommonRequest();
//        request.setSysMethod(MethodType.POST);
//        request.setSysDomain("dysmsapi.aliyuncs.com");
//        request.setSysVersion("2017-05-25");
//        request.setSysAction("SendSms");
//        request.putQueryParameter("RegionId", "cn-hangzhou");
//        request.putQueryParameter("PhoneNumbers", "13049150572");
//        request.putQueryParameter("SignName", "ting域系统");
//        request.putQueryParameter("TemplateCode", "SMS_204760980");
//        request.putQueryParameter("TemplateParam", "{\"code\":\"1111\"}");
//        try {
//            CommonResponse response = client.getCommonResponse(request);
//            System.out.println(response.getData());
//        } catch (ServerException e) {
//            e.printStackTrace();
//        } catch (ClientException e) {
//            e.printStackTrace();
//        }
    }

}
