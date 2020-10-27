package com.hzh.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.hzh.mapper.RoleMenuMapper;
import com.hzh.pojo.RoleMenu;
import com.hzh.service.IRoleMenuService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@Service
public class RoleMenuServiceImpl extends ServiceImpl<RoleMenuMapper, RoleMenu> implements IRoleMenuService {

    @Override
    public List<Integer> getMidByRid(Integer rid) {
        QueryWrapper<RoleMenu> qr = new QueryWrapper<>();
        qr.eq("rid",rid);
        List<RoleMenu> roleMenus = baseMapper.selectList(qr);
        List<Integer> mids = new ArrayList<>();

        for (RoleMenu roleMenu : roleMenus) {
            mids.add(roleMenu.getMid());
        }

        return mids;
    }
}
