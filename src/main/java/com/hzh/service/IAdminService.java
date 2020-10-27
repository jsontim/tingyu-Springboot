package com.hzh.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hzh.pojo.Admin;


/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
public interface IAdminService extends IService<Admin> {

    boolean insertorupdateAdmin(Admin admin, Integer rid);
}
