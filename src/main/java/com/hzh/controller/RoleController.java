package com.hzh.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.hzh.pojo.DataGridPageDate;
import com.hzh.pojo.MsgResult;
import com.hzh.pojo.Role;
import com.hzh.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private IRoleService roleService;

    @RequestMapping("/roleManager")
    public String roleManager(){
        return "roleManager";
    }

    @RequestMapping("/rolelist")
    @ResponseBody
    public DataGridPageDate rolelist(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows){
        Page<Role> rolePage = new Page<>(page,rows);
        Page<Role> result = roleService.page(rolePage);

        DataGridPageDate dataGridPageDate = new DataGridPageDate();
        dataGridPageDate.setTotal(result.getTotal());
        dataGridPageDate.setRows(result.getRecords());
        return dataGridPageDate;
    }

    @RequestMapping("/saveOrUpdateRole")
    @ResponseBody
    public MsgResult saveOrUpdateRole(Integer[] mids, Role role){
        boolean flag = roleService.saveOrUpdateRole(mids,role);
        return flag?new MsgResult(200,"操作成功!"):new MsgResult(400,"操作失败!请联系平台管理员");
    }

    @RequestMapping("/delRole")
    @ResponseBody
    public MsgResult delRole(Integer rid){
        boolean flag = roleService.delRole(rid);
        return flag?new MsgResult(200,"删除成功!"):new MsgResult(400,"删除失败!请联系平台管理员");
    }

}

