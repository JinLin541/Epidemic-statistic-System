package com.yueqian.epidemic.service.impl;

import com.yueqian.epidemic.beans.EpidemicDetailInfo;
import com.yueqian.epidemic.beans.EpidemicInfo;
import com.yueqian.epidemic.beans.ProvinceInfo;
import com.yueqian.epidemic.mapper.EpidemicMapper;
import com.yueqian.epidemic.mapper.ProvinceMapper;
import com.yueqian.epidemic.service.EpidemicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class EpidemicServiceImpl implements EpidemicService {

    @Autowired
    private EpidemicMapper epidemicMapper;

    @Override
    public int SaveInfo(EpidemicInfo epidemicInfo) {
        epidemicMapper.epidemicDataInput(epidemicInfo);
        return 0;
    }

    @Override
    public List<EpidemicDetailInfo> findLastData() {
        //得到当前日期的年月日
        Calendar calendar = new GregorianCalendar();
        int year=0,month=0,day=0;
        year = calendar.get(Calendar.YEAR);  //年份
        month=(calendar.get(Calendar.MARCH)+1);//月份，从0开始的，所以要加1
        day=calendar.get(Calendar.DATE);  //日

        Map<String,Integer> condition = new HashMap<>();
        condition.put("year",year);
        condition.put("month",month);
        condition.put("day",day);

        return epidemicMapper.findLastData(condition);
    }
}
