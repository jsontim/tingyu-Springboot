package com.hzh.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hzh.pojo.Company;
import com.hzh.pojo.DataGridPageDate;
import com.hzh.pojo.MsgResult;
import com.hzh.service.ICompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.Objects;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@Controller
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    private ICompanyService companyService;

    @RequestMapping("/companyManager")
    public String companyManager(){
        return "companyManager";
    }

    @RequestMapping("/list")
    @ResponseBody
    public DataGridPageDate companyList(Company company, Integer page, Integer rows){
        QueryWrapper<Company> qr = new QueryWrapper<>();

        System.out.println("company = " + company);
        if(com.baomidou.mybatisplus.core.toolkit.StringUtils.isNotBlank(company.getCname())){
            qr.like("cname",company.getCname());
        }
        if(StringUtils.isNotBlank(company.getStatus())){
            qr.eq("status",company.getStatus());
        }

        //这里拿的是company 里面的 ordernumber  所以用 objects.isnonnull
        if(Objects.nonNull(company.getOrdernumber())){
            if(company.getOrdernumber()==0){
                qr.orderByDesc("ordernumber");
            }else if(company.getOrdernumber()==1){
                qr.orderByAsc("ordernumber");
            }
        }

        Page<Company> companyPage = new Page<>(page,rows);
        Page<Company> companyList = companyService.page(companyPage,qr);

        //组装数据
        DataGridPageDate dataGridPageDate = new DataGridPageDate();
        dataGridPageDate.setTotal(companyList.getTotal());
        dataGridPageDate.setRows(companyList.getRecords());
        return dataGridPageDate;
    }

    @RequestMapping("/addorupdateCompany")
    @ResponseBody
    public MsgResult addCompany(Company company){
        boolean flag=true;
        if(Objects.isNull(company.getCid())){
            company.setStarttime(new Date());
            company.setStatus("2");
            flag = companyService.save(company);
        }else{
            flag = companyService.updateById(company);
        }

        return flag?new MsgResult(200,"操作成功!"):new MsgResult(400,"操作失败!请联系平台管理员");
    }

    @RequestMapping("/checkedStatus")
    @ResponseBody
    public MsgResult checkedStatus(Integer cid){
        UpdateWrapper<Company> ur = new UpdateWrapper<>();
        ur.eq("cid",cid);
        ur.set("status","1");
        boolean flag = companyService.update(ur);
        return flag?new MsgResult(200,"审核完成!"):new MsgResult(400,"操作失败!请联系平台管理员");
    }

    @RequestMapping("/updateStatus")
    @ResponseBody
    public MsgResult updateStatus(Integer cid,String status){
        UpdateWrapper<Company> ur = new UpdateWrapper<>();
        ur.eq("cid",cid);
        if(status.equals("0")){
            ur.set("status","1");
        }else if (status.equals("1")){
            ur.set("status","0");
        }else if(status.equals("2")){
            ur.set("status","1");
        }
        boolean flag = companyService.update(ur);
        return flag?new MsgResult(200,"操作成功!"):new MsgResult(400,"操作失败!请联系平台管理员");
    }

}

