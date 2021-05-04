package com.mrrisoni.ecommerce.controllers;

import com.mrrisoni.ecommerce.AppConfig;
import com.mrrisoni.ecommerce.daos.ProductDao;
import com.mrrisoni.ecommerce.models.Products;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductsController {
    @RequestMapping(value = "/api/product/{productId}", method = RequestMethod.GET)
    public Products getProductDetails(@PathVariable Long productId)
    {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        ProductDao prdDao = context.getBean(ProductDao.class);
        return  prdDao.findById(productId);
    }
}
