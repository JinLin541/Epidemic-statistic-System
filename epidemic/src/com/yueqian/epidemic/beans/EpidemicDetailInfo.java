package com.yueqian.epidemic.beans;

public class EpidemicDetailInfo extends EpidemicInfo {
    private String provinceName;
    private int affirmedTotal,suspectedTotal,isolatedTotal,curedTotal,deadTotal;

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public int getAffirmedTotal() {
        return affirmedTotal;
    }

    public void setAffirmedTotal(int affirmedTotal) {
        this.affirmedTotal = affirmedTotal;
    }

    public int getSuspectedTotal() {
        return suspectedTotal;
    }

    public void setSuspectedTotal(int suspectedTotal) {
        this.suspectedTotal = suspectedTotal;
    }

    public int getIsolatedTotal() {
        return isolatedTotal;
    }

    public void setIsolatedTotal(int isolatedTotal) {
        this.isolatedTotal = isolatedTotal;
    }

    public int getCuredTotal() {
        return curedTotal;
    }

    public void setCuredTotal(int curedTotal) {
        this.curedTotal = curedTotal;
    }

    public int getDeadTotal() {
        return deadTotal;
    }

    public void setDeadTotal(int deadTotal) {
        this.deadTotal = deadTotal;
    }
}
