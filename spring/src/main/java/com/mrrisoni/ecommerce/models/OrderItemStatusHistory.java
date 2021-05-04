package com.mrrisoni.ecommerce.models;

import lombok.Data;

import java.util.Date;

@Data
public class OrderItemStatusHistory {
    private static final long serialVersionUID = 1L;
    private Date createdAt;
    private OrderStatus statusObj;
    private OrderItems itemObj;

    public OrderItemStatusHistory() {
    }
}