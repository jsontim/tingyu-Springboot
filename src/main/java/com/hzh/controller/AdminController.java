package com.hzh.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.hzh.pojo.*;
import com.hzh.service.IAdminRoleService;
import com.hzh.service.IAdminService;
import com.hzh.service.IMenuService;
import com.hzh.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private IAdminService adminService;
    @Resource
    private IMenuService menuService;
    @Resource
    private IRoleService roleService;
    @Resource
    private IAdminRoleService adminRoleService;

    @RequestMapping("/login")
    public String login(String aname, String apwd, Model model, HttpSession session){
        Admin admin = new Admin();
        QueryWrapper qr = new QueryWrapper();
        qr.eq("aname",aname);
        qr.eq("apwd",apwd);
        Admin admin1 = admin.selectOne(qr);

        if(admin1 == null){
            model.addAttribute("ErrorMsg","用户名或密码输入错误,请重新再输!");
            return "forward:/login.jsp";
        }

        session.setAttribute("admin",admin1);
        return "redirect:/index.do";
    }


    @RequestMapping("/adminManager")
    public String adminManager(Model model){
//        QueryWrapper<Menu> qr1 = new QueryWrapper<>();
//        qr1.eq("pid",0);
//        List<Menu> titles = menuService.list(qr1);
//        model.addAttribute("titles",titles);
//
//        QueryWrapper<Menu> qr2 = new QueryWrapper<>();
//        qr2.gt("pid",0);
//        List<Menu> items = menuService.list(qr2);
//        model.addAttribute("items",items);

        List<Role> roles = roleService.list();
        model.addAttribute("roles",roles);

//        List<AdminRole> adminRoles = adminRoleService.list();
//        model.addAttribute("adminRoles",adminRoles);

        return "adminManager";
    }

    @RequestMapping("/list")
    @ResponseBody
    public DataGridPageDate getAdminList(Integer page, Integer rows){
        Page<Admin> adminPage = new Page<>(page, rows);
        Page<Admin> result = adminService.page(adminPage);

        DataGridPageDate dataGridPageDate = new DataGridPageDate();
        dataGridPageDate.setTotal(result.getTotal());
        dataGridPageDate.setRows(result.getRecords());
        return dataGridPageDate;
    }

    @RequestMapping("/insertorupdateAdmin")
    @ResponseBody
    public MsgResult insertorupdateAdmin(Admin admin, Integer rid){
        boolean flag = adminService.insertorupdateAdmin(admin,rid);
        return flag?new MsgResult(200,"管理员添加成功!"):new MsgResult(400,"管理员添加失败!请联系平台管理员");
    }

    @RequestMapping("/getRoleByAid")
    @ResponseBody
    public List<AdminRole> getRoleByAid(Integer aid){
        QueryWrapper<AdminRole> qr = new QueryWrapper<>();
        qr.eq("aid",aid);
        List<AdminRole> adminRoles = adminRoleService.list(qr);

        return adminRoles;
    }

}

