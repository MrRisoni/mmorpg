package com.mrrisoni.ecommerce.models;

import lombok.Data;

@Data
public class PaymentMethods {
    private Long id;
    private String title;
    private String code;

    public PaymentMethods() {
    }
}
