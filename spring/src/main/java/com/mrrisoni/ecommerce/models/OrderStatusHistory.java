package com.mrrisoni.ecommerce.models;

import lombok.Data;

import java.util.Date;

@Data
public class OrderStatusHistory {
    private Long id;
    private Date createdAt;
    private OrderStatus statusObj;

    public OrderStatusHistory() {
    }
}