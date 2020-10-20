package com.yueqian.epidemic.controller;

import com.yueqian.epidemic.beans.*;
import com.yueqian.epidemic.service.EpidemicService;
import com.yueqian.epidemic.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/epidemicData")
public class EpidemicController {

    @Autowired
    private EpidemicService epidemicService;

    @Autowired
    private ProvinceService provinceService;

    @PostMapping("/ajax/input")
    @ResponseBody
    public AjaxResponseInfo<List<ProvinceInfo>> epidemicDataInput(@RequestBody DailyEpidemicInfo data, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
        //从session中获得当前登录的用户信息
        UserInfo user = (UserInfo) session.getAttribute("loginedUser");
        Date current = new Date();
        AjaxResponseInfo<List<ProvinceInfo>> responseInfo = new AjaxResponseInfo<>();
        if (user == null) {
            responseInfo.setCode(-2);
            responseInfo.setMsg("你还没有登录！！");

            response.sendRedirect(request.getContextPath()+"/login.jsp");
        } else {  //已经登录了
            if (data.getArrayData() != null && data.getArrayData().size() > 0) {
                String[] ymd = data.getDate().split("-");
                int year = 0, month = 0, day = 0;
                year = Integer.parseInt(ymd[0]);  //年份
                month = Integer.parseInt(ymd[1]);  //月份
                day = Integer.parseInt(ymd[2]);  //日

                for (EpidemicInfo info : data.getArrayData()) {
                    info.setDataYear(year);
                    info.setDataMonth(month);
                    info.setDataDay(day);
                    info.setInputDate(new Date());
                    info.setUserId(user.getUserId());
                    epidemicService.SaveInfo(info);  //保存
                }
            }
            List<ProvinceInfo> list = provinceService.getProvinceNoDate(data.getDate());
            responseInfo.setData(list);
        }
        return responseInfo;
    }

    @GetMapping(value = "/ajax/getLastData")
    @ResponseBody
    public AjaxResponseInfo getLastData() {
        AjaxResponseInfo responseInfo = new AjaxResponseInfo();
        List<EpidemicDetailInfo> list = epidemicService.findLastData();
        if (list.size() == 0) {
            responseInfo.setCode(-1);
            responseInfo.setMsg("没有数据");
        } else {
            responseInfo.setData(list);
        }
        return responseInfo;
    }
}
