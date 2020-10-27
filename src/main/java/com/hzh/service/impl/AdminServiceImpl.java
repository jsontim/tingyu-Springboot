package com.hzh.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.hzh.mapper.AdminMapper;
import com.hzh.mapper.AdminRoleMapper;
import com.hzh.pojo.Admin;
import com.hzh.pojo.AdminRole;
import com.hzh.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements IAdminService {
    @Resource
    private AdminRoleMapper adminRoleMapper;

    @Override
    public boolean insertorupdateAdmin(Admin admin, Integer rid) {
        admin.setStarttime(new Date());
        boolean flag = this.saveOrUpdate(admin);
        if(!flag){
            return false;
        }

        UpdateWrapper<AdminRole> ur = new UpdateWrapper<>();
        ur.eq("aid",admin.getAid());
        int delete = adminRoleMapper.delete(ur);
        if(delete == 0){
            return false;
        }

        AdminRole adminRole = new AdminRole();
        adminRole.setRid(rid);
        adminRole.setAid(admin.getAid());
        int adminroleCount = adminRoleMapper.insert(adminRole);
        if(adminroleCount == 0){
            return false;
        }
        return true;
    }
}
