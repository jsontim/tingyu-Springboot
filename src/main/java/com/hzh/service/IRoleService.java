package com.hzh.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hzh.pojo.Role;


/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
public interface IRoleService extends IService<Role> {

    boolean saveOrUpdateRole(Integer[] mids, Role role);

    boolean delRole(Integer rid);
}
