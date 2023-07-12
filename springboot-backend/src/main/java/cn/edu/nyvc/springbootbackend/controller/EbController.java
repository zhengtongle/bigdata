package cn.edu.nyvc.springbootbackend.controller;

import cn.edu.nyvc.springbootbackend.entity.*;
import cn.edu.nyvc.springbootbackend.mapper.EbMapper;
import lombok.AllArgsConstructor;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")

@AllArgsConstructor
public class EbController {
    private EbMapper mapper;

    @GetMapping("conversion_rate")
    public ConversionRate getConversionRate() {
        return mapper.selectConversionRate();
    }

    @GetMapping("userAgeCount")
    public List<UserAgeCount> getUserAgeCount() {
        return mapper.selectUserAgeCount();
    }

    @GetMapping("customerTypeCount")
    public CustomerTypeCount getCustomerTypeCount() {
        return mapper.selectCustomerTypeCount();
    }

    @GetMapping("dayPv")
    public List<DayPv> getDayPv() {
        return mapper.selectDayPv();
    }

    @GetMapping("maleRatio")
    public String getSexRatio() {
        return mapper.selectSexRatio();
    }

    @GetMapping("userAddressCount")
    public UserAddressCount getUserAddressCount() {
        return mapper.selectUserAddressCount();
    }

    @GetMapping("totalPv")
    public TotalPv getTotalPv() {
        return mapper.selectTotalPv();
    }

    @GetMapping("week")
    public List<Week> getWeek() {
        return mapper.selectWeek();
    }
}
