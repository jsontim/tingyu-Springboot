package com.hzh.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.hzh.mapper.HostMapper;
import com.hzh.pojo.DataGridPageDate;
import com.hzh.pojo.Host;
import com.hzh.service.IHostService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@Service
public class HostServiceImpl extends ServiceImpl<HostMapper, Host> implements IHostService {
    @Resource
    private HostMapper hostMapper;

    @Override
    public DataGridPageDate selectPageData(Host host, Integer currentPage, Integer pageSize) {
        // 1.可以加查询条件
        QueryWrapper qr = new QueryWrapper();
        // 判断条件
        String hname = host.getHname();
        System.out.println("hname = " + hname);

        String strong = host.getStrong();
        System.out.println("strong = " + strong);

        String status = host.getStatus();
        System.out.println("status = " + status);

        Integer ordernumber = host.getOrdernumber();
        String hpstar = host.getHpstar();
        Integer hpdiscount = host.getHpdiscount();

        if (!StringUtils.isBlank(hname)) {
            qr.like("hname",hname);
        }

        if (!StringUtils.isBlank(strong)) {
            if(strong.equals("desc")){
                qr.orderByDesc("strong");
            }else if(strong.equals("asc")){
                qr.orderByAsc("strong");
            }
        }

        if (!StringUtils.isBlank(status)) {
            qr.eq("status",status);
        }

        if (!Objects.isNull(ordernumber)) {
            if(ordernumber==0){
                qr.orderByDesc("ordernumber");
            }else if(ordernumber==1){
                qr.orderByAsc("ordernumber");
            }
        }

        if (!StringUtils.isBlank(hpstar)) {
            if(hpstar.equals("1")){
                qr.eq("hpstar","1");
            }else if(hpstar.equals("0")){
                qr.isNull("hpstar");
            }
        }

        if (!Objects.isNull(hpdiscount)) {
            qr.eq("hpdiscount",hpdiscount);
        }

        // 2.获取分页
        Page<Host> hostPage = new Page<>(currentPage, pageSize);
        IPage iPage = hostMapper.selectPageData(hostPage, qr);

        // 3. 注入回写数据
        long total = iPage.getTotal();
        List<Host> list = iPage.getRecords();
        DataGridPageDate dg = new DataGridPageDate();
        dg.setRows(list);
        dg.setTotal(total);

        return dg;
    }
}
