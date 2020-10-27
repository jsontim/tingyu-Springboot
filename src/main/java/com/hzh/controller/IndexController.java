package com.hzh.controller;


import com.hzh.pojo.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {
    @RequestMapping("/index")
    public String index(HttpSession session){
        Admin admin = (Admin)session.getAttribute("admin");
        System.out.println("admin = " + admin);
        if(admin == null){
            //直接访问
            return "forward:/login.jsp";
        }
        return "index";
    }
}
