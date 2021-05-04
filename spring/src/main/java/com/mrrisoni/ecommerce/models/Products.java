package com.mrrisoni.ecommerce.models;

import lombok.Data;

import java.util.List;

@Data
public class Products {

    private Long id;
    private String code;
    private String title;
    List<Reviews> reviews;

    public Products() {
    }

    public Products(Long id, String code, String title) {
        this.id = id;
        this.code = code;
        this.title = title;
    }
}