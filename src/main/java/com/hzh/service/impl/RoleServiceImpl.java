package com.hzh.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.hzh.mapper.RoleMapper;
import com.hzh.mapper.RoleMenuMapper;
import com.hzh.pojo.AdminRole;
import com.hzh.pojo.Role;
import com.hzh.pojo.RoleMenu;
import com.hzh.service.IAdminRoleService;
import com.hzh.service.IRoleService;
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
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {
    @Resource
    private RoleMapper roleMapper;
    @Resource
    private RoleMenuMapper roleMenuMapper;
    @Resource
    private IAdminRoleService adminRoleService;

    @Override
    public boolean saveOrUpdateRole(Integer[] mids, Role role) {
        Integer startRid = role.getRid();
        boolean flag = true;
        //1.没id添加 或  有id更新  到角色表
        flag = this.saveOrUpdate(role);

        //2. 此时返回一个有rid 的 role  对象   先删除对应的rid 的 rolemenu 数据   再insert rolemenu对象
        UpdateWrapper<RoleMenu> ur = new UpdateWrapper<>();
        ur.eq("rid",role.getRid());
        int delCount = roleMenuMapper.delete(ur);
        if(Objects.nonNull(startRid) && delCount==0){
            flag = false;
        }

        // 3.插入新的记录
        for (Integer mid : mids) {
            RoleMenu roleMenu = new RoleMenu();
            roleMenu.setRid(role.getRid());
            roleMenu.setMid(mid);
            int insertCount = roleMenuMapper.insert(roleMenu);
            if (insertCount == 0){
                flag = false;
            }
        }
        return flag;
    }

    @Override
    public boolean delRole(Integer rid) {
        // 判断这个 角色是否有用户在用
        QueryWrapper<AdminRole> qr = new QueryWrapper<>();
        qr.eq("rid",rid);
        List<AdminRole> adminRoles = adminRoleService.list(qr);
        if (adminRoles.size()>0) {
            return false;
        }

        // 删除 role  表数据
        //boolean flag = true;
        UpdateWrapper<Role> ur = new UpdateWrapper<>();
        ur.eq("rid",rid);
        int delCount = roleMapper.delete(ur);
        if(delCount==0){
            //flag = false;
            return false;
        }

        //  删除  role  权限表数据
        UpdateWrapper<RoleMenu> ur2 = new UpdateWrapper<>();
        ur2.eq("rid",rid);
        int delete = roleMenuMapper.delete(ur2);
        if(delete<=1){
            return false;
        }

        return true;
    }
}
