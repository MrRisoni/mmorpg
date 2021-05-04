package com.mrrisoni.ecommerce.models;

import lombok.Data;

import java.util.Date;

@Data
public class OrderStatus {
    private Long id;
    private String title;
    private Date createdAt;

    public OrderStatus() {
    }
}