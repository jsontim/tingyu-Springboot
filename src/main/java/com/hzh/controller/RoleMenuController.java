package com.hzh.controller;



import com.hzh.service.IRoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2020-10-10
 */
@Controller
@RequestMapping("/roleMenu")
public class RoleMenuController {
    @Autowired
    private IRoleMenuService roleMenuService;

    @RequestMapping("/getMidByRid")
    @ResponseBody
    public List<Integer> getMidByRid(Integer rid){
        List<Integer> mids = roleMenuService.getMidByRid(rid);
        return mids;
    }

}

