package com.hzh.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hzh.pojo.RoleMenu;


import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
public interface IRoleMenuService extends IService<RoleMenu> {

    List<Integer> getMidByRid(Integer rid);
}
