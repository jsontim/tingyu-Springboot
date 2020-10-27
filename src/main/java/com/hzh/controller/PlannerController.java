package com.hzh.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.hzh.pojo.DataGridPageDate;
import com.hzh.pojo.Planner;
import com.hzh.service.IPlannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
@RequestMapping("/planner")
public class PlannerController {
    @Autowired
    private IPlannerService plannerService;

    @RequestMapping("/list")
    @ResponseBody
    public DataGridPageDate list(Integer cid, Integer page, Integer rows){
        Page<Planner> plannerPage = new Page<>(page,rows);
        QueryWrapper<Planner> qr = new QueryWrapper<>();
        qr.eq("cid",cid);
        Page<Planner> list = plannerService.page(plannerPage, qr);

        DataGridPageDate dataGridPageDate = new DataGridPageDate();
        dataGridPageDate.setTotal(list.getTotal());
        dataGridPageDate.setRows(list.getRecords());

        return dataGridPageDate;


    }

}

