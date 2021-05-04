package com.mrrisoni.ecommerce;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan
@SpringBootApplication
public class EcommerceApplication {
    public static void main(String[] args) {
        try {
            SpringApplication.run(EcommerceApplication.class, args);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
