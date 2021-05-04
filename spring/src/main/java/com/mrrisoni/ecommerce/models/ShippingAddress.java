package com.mrrisoni.ecommerce.models;

import lombok.Data;

import java.util.Collection;

@Data
public class ShippingAddress {
    private Long id;
    private String countryCode;
    private String contactMobile;
    private String city;
    private String fullName;
    private String address;
    private String postCode;
    private  String streetNo;

    public ShippingAddress() {
    }

}