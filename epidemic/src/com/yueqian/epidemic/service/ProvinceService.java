package com.yueqian.epidemic.service;

import com.yueqian.epidemic.beans.ProvinceInfo;

import java.util.List;

public interface ProvinceService {
    /**
     * 从数据库获得还没有录入的省份信息
     * @param date
     * @return
     */
    List<ProvinceInfo> getProvinceNoDate(String date);
}
