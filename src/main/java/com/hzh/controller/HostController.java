package com.hzh.controller;


import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.hzh.pojo.DataGridPageDate;
import com.hzh.pojo.Host;
import com.hzh.pojo.MsgResult;
import com.hzh.service.IHostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@Controller
@RequestMapping("/host")
public class HostController {
    @Autowired
    private IHostService hostService;

    @RequestMapping("/hostManager")
    public String hostManager(){
        return "hostManager";
    }

    @RequestMapping("/pageData")
    @ResponseBody
    public DataGridPageDate pageDate(Host host, Integer page, Integer rows){
        System.out.println("host = " + host);
        System.out.println("page = " + page);
        System.out.println("rows = " + rows);
        DataGridPageDate dg = hostService.selectPageData(host, page, rows);
        return dg;
    }

    @ResponseBody
    @RequestMapping("/addHost")
    public MsgResult addHost(Host host){
        host.setStarttime(new Date());
        host.setStrong("10");
        host.setStatus("1");
        boolean flag = hostService.save(host);
        return flag?new MsgResult(200,"添加成功!"):new MsgResult(400,"添加失败!请联系平台管理员");
    }

    @ResponseBody
    @RequestMapping("/updateStatus")
    public MsgResult updateStatus(Integer hid,String status){
        System.out.println("hid = " + hid);
        System.out.println("status = " + status);
//        Host host = new Host();
//        host.setHid(hid);
//        if("0".equals(status)){
//            host.setStatus("1");
//        }else{
//            host.setStatus("0");
//        }
        UpdateWrapper<Host> ur = new UpdateWrapper<Host>();
        if("0".equals(status)){
            ur.set("status","1");
        }else{
            ur.set("status","0");
        }
        ur.eq("hid",hid);
        boolean flag = hostService.update(ur);
        return flag?new MsgResult(200,"修改成功!"):new MsgResult(400,"修改失败!请联系平台管理员");
    }

    @RequestMapping("/updateStrong")
    @ResponseBody
    public MsgResult updateStrong(Integer hid,String strong){
        UpdateWrapper<Host> ur = new UpdateWrapper<Host>();
        ur.set("strong",strong);
        ur.eq("hid",hid);
        boolean flag = hostService.update(ur);
        return flag?new MsgResult(200,"权重修改成功!"):new MsgResult(400,"权重修改失败!请联系平台管理员");
    }


}

