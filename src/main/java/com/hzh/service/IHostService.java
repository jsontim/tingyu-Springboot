package com.hzh.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hzh.pojo.DataGridPageDate;
import com.hzh.pojo.Host;


/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
public interface IHostService extends IService<Host> {
    DataGridPageDate selectPageData(Host host, Integer currentPage, Integer pageSize);
}
