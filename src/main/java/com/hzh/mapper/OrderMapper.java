package com.hzh.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hzh.pojo.Order;
import org.apache.ibatis.annotations.Mapper;


/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@Mapper
public interface OrderMapper extends BaseMapper<Order> {

}
