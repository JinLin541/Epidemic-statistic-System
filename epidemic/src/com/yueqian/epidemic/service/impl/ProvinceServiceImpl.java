package com.yueqian.epidemic.service.impl;

import com.yueqian.epidemic.beans.ProvinceInfo;
import com.yueqian.epidemic.mapper.ProvinceMapper;
import com.yueqian.epidemic.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
public class ProvinceServiceImpl implements ProvinceService {

    @Autowired
    private ProvinceMapper provinceMapper;

    @Override
    public List<ProvinceInfo> getProvinceNoDate(String date) {
        List<ProvinceInfo> list = null;
        if (!StringUtils.isEmpty(date)) {
            String[] ymd = date.split("-");
            int year, month, day;
            year = Integer.parseInt(ymd[0]);  //年
            month = Integer.parseInt(ymd[1]); //月
            day = Integer.parseInt(ymd[2]); //日
            list = provinceMapper.getProvinceNoDateInput(year, month, day);
        }
        return list;
    }
}
