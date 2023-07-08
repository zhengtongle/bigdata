package cn.edu.nyvc.springbootbackend.controller;

import cn.edu.nyvc.springbootbackend.entity.*;
import cn.edu.nyvc.springbootbackend.mapper.EbMapper;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.DayOfWeek;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class EbController {
    private EbMapper mapper;


    @GetMapping("userAgeCount")
    public List<UserAgeCount> getUserAgeCount() {
        return mapper.selectUserAgeCount();
    }

    @GetMapping("customerTypeCount")
    public CustomerTypeCount getCustomerTypeCount() {
        return mapper.selectCustomerTypeCount();
    }

    @GetMapping("dgayPv")
    public List<DayPv> getDayPv() {
        return mapper.selectDayPv();
    }

    @GetMapping("sexRatio")
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
    public List<Week> getWeek(){
        return mapper.selectWeek();
    }
}
