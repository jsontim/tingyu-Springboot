package com.hzh.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import com.hzh.mapper.HostPowerMapper;
import com.hzh.pojo.HostPower;
import com.hzh.pojo.MsgResult;
import com.hzh.service.IHostPowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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
@RequestMapping("/hostPower")
public class HostPowerController {
    @Resource
    private HostPowerMapper hostPowerMapper;
    @Autowired
    private IHostPowerService hostPowerService;

    @ResponseBody
    @RequestMapping("/setPower")
    public MsgResult setPower(Integer[] hostids, HostPower hostPower){

        boolean b = true;
        int error = 0;
        for (Integer hostid : hostids) {
            hostPower.setHostid(hostid);
            b = hostPowerService.save(hostPower);
            if(!b){
                error++;
            }
        }
        return error==0?new MsgResult(200,"权限设置成功!"):new MsgResult(400,"权限设置失败!请联系平台管理员");
    }


    @RequestMapping("/getHostPower")
    @ResponseBody
    public List<HostPower> getHostPower(Integer hostid){
        QueryWrapper<HostPower> qr = new QueryWrapper<>();
        qr.eq("hostid",hostid);
        List<HostPower> list = hostPowerService.list(qr);
        System.out.println("list = " + list);
        if(list.size()==0){
            return null;
        }else if(list.size() > 1){
            return null;
        }
        return list;
    }


}

