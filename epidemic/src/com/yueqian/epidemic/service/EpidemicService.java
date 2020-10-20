package com.yueqian.epidemic.service;

import com.yueqian.epidemic.beans.EpidemicDetailInfo;
import com.yueqian.epidemic.beans.EpidemicInfo;

import java.util.List;

public interface EpidemicService {

    /**
     * 保存疫情数据并且生成新的未录入的省份信息
     * @param epidemicInfo
     * @return
     */
    int SaveInfo(EpidemicInfo epidemicInfo);

    List<EpidemicDetailInfo> findLastData();
}
