package com.hzh.controller;



import com.hzh.pojo.Admin;
import com.hzh.pojo.Menu;
import com.hzh.pojo.MsgResult;
import com.hzh.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private IMenuService menuService;

    @ResponseBody
    @RequestMapping("/menuTreeByManager")
    public List<Menu> menuTree(HttpSession session){
        Admin admin = (Admin)session.getAttribute("admin");
        List<Menu> menus = menuService.menuTree(admin.getAid());
        return menus;
    }

    @ResponseBody
    @RequestMapping("/menuTree")
    public List<Menu> rolemenuTree(){
        List<Menu> menus = menuService.list();
        return menus;
    }

    @RequestMapping("/menuTreeByadmin")
    @ResponseBody
    public List<Menu> menuTreeByadmin(Integer aid){
        List<Menu> menus = menuService.menuTree(aid);
        return menus;
    }

    @RequestMapping("/menuManager")
    public String menuManager(){
        return "menuManager";
    }

    @RequestMapping("/saveOrUpdateMenu")
    @ResponseBody
    public MsgResult saveOrUpdateMenu(Menu menu){
        menu.setIsparent("1");
        menu.setStatus("0");

        boolean flag = menuService.saveOrUpdate(menu);
        return flag?new MsgResult(200,"添加菜单成功!"):new MsgResult(400,"添加菜单失败!请联系平台管理员");
    }

    @RequestMapping("/delMenu")
    @ResponseBody
    public MsgResult delMenu(Integer mid){
        boolean flag = menuService.removeById(mid);
        return flag?new MsgResult(200,"菜单删除成功!"):new MsgResult(400,"菜单删除失败!请联系平台管理员");
    }

}

