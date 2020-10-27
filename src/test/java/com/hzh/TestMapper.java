package com.hzh;

import com.hzh.mapper.AdminMapper;
import com.hzh.mapper.MenuMapper;
import com.hzh.pojo.Admin;
import com.hzh.pojo.Menu;
import com.hzh.service.IMenuService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.List;

@SpringBootTest
public class TestMapper {
    @Resource
    private AdminMapper adminMapper;

    @Resource
    private MenuMapper menuMapper;

    @Test
    void testAdmin(){
        List<Admin> admins = adminMapper.selectList(null);
        for (Admin admin : admins) {
            System.out.println("admin = " + admin);
        }
    }

    @Test
    void testMenu(){
        List<Menu> menus = menuMapper.menuTree(1);
        for (Menu menu : menus) {
            System.out.println(menu);
        }

    }
}
