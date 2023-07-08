package cn.edu.nyvc.springbootbackend.entity;

import lombok.Data;

import java.sql.Date;

@Data
public class DayPv {
    Date date;
    Integer pv;
    Integer uv;
}
