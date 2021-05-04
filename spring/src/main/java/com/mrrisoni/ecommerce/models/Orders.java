package com.mrrisoni.ecommerce.models;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;

@Data
public class Orders {
    private Long id;
    private Long billAddressId;
    private Long shipAddressId;
    private String currency;
    private BigDecimal currency_rate;
    private BigDecimal total;
    private BigDecimal net;
    private BigDecimal commission;
    private BigDecimal tax;
    private BigDecimal shipping;
    private BigDecimal courrierFees;
    private boolean success;
    private boolean isVoid;
    private boolean refund;
    private Date createdAt;
    private Date updatedAt;

    private Shop shop;
    private BillingAddress billAddress;
    private ShippingAddress shipAddress;
    private PaymentMethod payMethod;
    private OrderStatus currentStatus;

    Collection<OrderItems> items;
    Collection<OrderStatus> statusHistory;


    public Orders() {
    }

    public Orders(Long id) {
        this.id = id;
    }
}