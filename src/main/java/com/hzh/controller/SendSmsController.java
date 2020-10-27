package com.hzh.controller;


import com.hzh.utils.AliyunSendSmsUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Objects;

@Controller
public class SendSmsController {

    @RequestMapping("/sendSms")
    @ResponseBody
    public Object sendSms(String phone, HttpSession session){
        Integer verifycode = AliyunSendSmsUtils.getRandomCode();
        Object sms = AliyunSendSmsUtils.sendSms(phone, verifycode);
        System.out.println("verifycode = " + verifycode);

        session.setAttribute("verifycode",verifycode);
        session.setMaxInactiveInterval(60);
        return sms;
    }

    @RequestMapping("/verifycode")
    @ResponseBody
    public boolean verifycode(String verifycode, HttpSession session){
        Object realcode = session.getAttribute("verifycode");
        System.out.println("realcode = " + realcode);
        if(Objects.isNull(realcode)){
            return false;
        }
        if(realcode.toString().equals(verifycode)){
            return true;
        }
        return false;
    }
}
