package com.hzh.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hzh.pojo.Menu;
import org.apache.ibatis.annotations.Mapper;


import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@Mapper
public interface MenuMapper extends BaseMapper<Menu> {
    List<Menu> menuTree(Integer aid);
}
