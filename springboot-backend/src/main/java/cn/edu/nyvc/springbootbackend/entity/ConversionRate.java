package cn.edu.nyvc.springbootbackend.entity;

import lombok.Data;

@Data
public class ConversionRate {
    private Integer pv;
    private Integer fav;
    private Integer cart;

    private Integer favCart;
    private Integer buy;
    private Float pv2favcart;
    private Float favcart2buy;
    private Float pv2buy;
}
