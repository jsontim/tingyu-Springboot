package com.hzh.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.hzh.mapper.MenuMapper;
import com.hzh.pojo.Menu;
import com.hzh.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {

    @Resource
    private MenuMapper menuMapper;

    @Override
    public List<Menu> menuTree(Integer aid) {
        List<Menu> menus = menuMapper.menuTree(aid);
        return menus;
    }
}
