
package com.mrrisoni.ecommerce.models;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;

@Data
public class OrderItems {
    private Long id;
    private int quantity;
    private String trackingNo;
    private BigDecimal netPrice;
    private BigDecimal taxes;
    private BigDecimal giftCost;
    private boolean success;
    private boolean isVoid;
    private boolean refund;
    private Date dispatchedOn;
    private Date expectedOn;
    private Date arrivedOn;

    private Products product;
    private OrderStatus status;

    Collection<OrderStatus> statusHistory;


    public OrderItems() {
    }

    public OrderItems(Long id) {
        this.id = id;
    }
}