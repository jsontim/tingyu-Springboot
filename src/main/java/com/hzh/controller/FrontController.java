package com.hzh.controller;


import com.hzh.pojo.MarriedPerson;
import com.hzh.pojo.MsgResult;
import com.hzh.service.IMarriedPersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDateTime;
import java.util.Date;

@Controller
public class FrontController {
    @Autowired
    private IMarriedPersonService marriedPersonService;

    @RequestMapping("/register")
    @ResponseBody
    public MsgResult register(MarriedPerson marriedPerson){
        marriedPerson.setRegdate(new Date());
        marriedPerson.setStatus("1");

        boolean flag = marriedPersonService.save(marriedPerson);
        return flag?new MsgResult(200,"注册完成!"):new MsgResult(400,"注册失败!请联系平台管理员");
    }
}
