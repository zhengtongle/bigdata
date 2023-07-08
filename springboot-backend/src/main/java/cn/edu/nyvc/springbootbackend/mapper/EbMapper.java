package cn.edu.nyvc.springbootbackend.mapper;

import cn.edu.nyvc.springbootbackend.entity.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface EbMapper {
    @Select("select * from user_age_count")
    List<UserAgeCount> selectUserAgeCount();

    @Select("select * from customer_type_count")
    CustomerTypeCount selectCustomerTypeCount();

    @Select("select * from day_pv")
    List<DayPv> selectDayPv();

    @Select("select male from male_ratio")
    String selectSexRatio();

    @Select("select * from total_pv")
    TotalPv selectTotalPv();

    @Select("select * from user_address_count")
    UserAddressCount selectUserAddressCount();

    @Select("select * from week")
    List<Week> selectWeek();
}
