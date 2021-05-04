package com.mrrisoni.ecommerce.models;

import lombok.Data;

@Data
public class BillingAddress {
    private Long id;
    private String countryCode;
    private String contactMobile;
    private String city;
    private String fullName;
    private String address;
    private String streetNo;
    private String postCode;


    public BillingAddress() {
    }
}