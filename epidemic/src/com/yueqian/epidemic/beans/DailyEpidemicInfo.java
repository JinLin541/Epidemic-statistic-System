package com.yueqian.epidemic.beans;

import java.util.List;

public class DailyEpidemicInfo {
    private String date;
    private List<EpidemicInfo> arrayData;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public List<EpidemicInfo> getArrayData() {
        return arrayData;
    }

    public void setArrayData(List<EpidemicInfo> arrayData) {
        this.arrayData = arrayData;
    }
}
