package com.yueqian.epidemic.mapper;

import com.yueqian.epidemic.beans.EpidemicDetailInfo;
import com.yueqian.epidemic.beans.EpidemicInfo;
import com.yueqian.epidemic.beans.ProvinceInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface EpidemicMapper {

    @Insert(value = "INSERT into epidemic(province_id,data_year,data_month,data_day,affirmed,suspected, " +
            "isolated,dead,cured,user_id,input_date) values(#{provinceId},#{dataYear},#{dataMonth},#{dataDay}, " +
            "#{affirmed},#{suspected},#{isolated},#{dead},#{cured},#{userId},#{inputDate});")
    int epidemicDataInput(EpidemicInfo epidemicInfo);

    @Select(value = "select e1.province_id,temp.province_name,data_year,data_month,data_day, " +
            "  affirmed,suspected,isolated,cured,dead, " +
            " affirmedTotal,suspectedTotal,isolatedTotal,curedTotal,deadTotal " +
            " from epidemic e1 RIGHT JOIN ( " +
            " SELECT e.province_id,p.province_name, " +
            " SUM(e.affirmed) affirmedTotal, " +
            " SUM(suspected) suspectedTotal, " +
            " SUM(isolated) isolatedTotal, " +
            " SUM(cured) curedTotal, " +
            " SUM(dead) deadTotal from epidemic e  " +
            " RIGHT JOIN provinces p on p.province_id = e.province_id  " +
            " GROUP BY e.province_id,p.province_name " +
            ") temp on temp.province_id=e1.province_id  " +
            "where data_year=#{year} and data_month=#{month} and data_day=#{day}")
    List<EpidemicDetailInfo> findLastData(Map<String,Integer> condition);
}
