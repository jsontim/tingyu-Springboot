package com.hzh.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.hzh.mapper.HostPowerMapper;
import com.hzh.pojo.HostPower;
import com.hzh.service.IHostPowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@Service
public class HostPowerServiceImpl extends ServiceImpl<HostPowerMapper, HostPower> implements IHostPowerService {
    @Resource
    private HostPowerMapper hostPowerMapper;

}
