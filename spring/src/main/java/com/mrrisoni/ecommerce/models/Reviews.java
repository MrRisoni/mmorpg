package com.mrrisoni.ecommerce.models;

import lombok.Data;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

@Data
public class Reviews {
    private Long id;
    private BigDecimal stars;
    private String comment;
    private Timestamp createdAt;

}
