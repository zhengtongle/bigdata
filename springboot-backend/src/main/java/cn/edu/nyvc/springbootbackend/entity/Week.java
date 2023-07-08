package cn.edu.nyvc.springbootbackend.entity;

import lombok.Data;

@Data
public class Week {
    private Integer week;
    private Integer pv;
    private Integer follow;
    private Integer cart;
    private Integer buy;
}
