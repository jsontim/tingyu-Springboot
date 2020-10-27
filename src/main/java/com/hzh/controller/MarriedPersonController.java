package com.hzh.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.hzh.pojo.DataGridPageDate;
import com.hzh.pojo.MarriedPerson;
import com.hzh.pojo.MsgResult;
import com.hzh.service.IMarriedPersonService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@Controller
@RequestMapping("/married")
public class MarriedPersonController {

    @Autowired
    private IMarriedPersonService marriedPersonService;

    @RequestMapping("/marriedManager")
    public String marriedManager() {
        return "marriedManager";
    }

    @RequestMapping("/list")
    @ResponseBody
    public DataGridPageDate getMarriedPage(MarriedPerson marriedPerson, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows) {
        QueryWrapper<MarriedPerson> qr = new QueryWrapper<>();
        if (StringUtils.isNotBlank(marriedPerson.getPname())) {
            qr.like("pname", marriedPerson.getPname());
        }
        if(StringUtils.isNotBlank(marriedPerson.getPhone())){
            qr.like("phone",marriedPerson.getPhone());
        }

        Page<MarriedPerson> personPage = new Page<>(page, rows);
        Page<MarriedPerson> marriedPersonPage = marriedPersonService.page(personPage, qr);

        DataGridPageDate dataGridPageDate = new DataGridPageDate();
        dataGridPageDate.setTotal(marriedPersonPage.getTotal());
        dataGridPageDate.setRows(marriedPersonPage.getRecords());

        return dataGridPageDate;
    }

    @RequestMapping("/register")
    @ResponseBody
    public MsgResult register(MarriedPerson marriedPerson){
        marriedPerson.setRegdate(new Date());
        marriedPerson.setStatus("1");

        boolean flag = marriedPersonService.save(marriedPerson);
        return flag?new MsgResult(200,"注册成功!"):new MsgResult(400,"注册失败!请联系平台管理员");
    }

}

