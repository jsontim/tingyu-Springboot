package com.hzh.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hzh.pojo.Host;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@Mapper
public interface HostMapper extends BaseMapper<Host> {

    @Select("select h.*,hp.hpdiscount,hp.hpstar from t_host h left join t_host_power hp on h.hid=hp.hostid ${ew.customSqlSegment}")
    IPage<Host> selectPageData(Page<Host> page, @Param(Constants.WRAPPER) Wrapper<Host> wrapper);

}
