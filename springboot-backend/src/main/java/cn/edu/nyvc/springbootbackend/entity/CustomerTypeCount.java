package cn.edu.nyvc.springbootbackend.entity;

import lombok.Data;

@Data
public class CustomerTypeCount {
    private Integer 重要价值用户;
    private Integer 消费潜力用户;
    private Integer 频次深耕用户;
    private Integer 新客户;
    private Integer 重要价值流失预警客户;
    private Integer 高消费客户;
}
