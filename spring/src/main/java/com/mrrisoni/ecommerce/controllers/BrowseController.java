package com.mrrisoni.ecommerce.controllers;


import com.mrrisoni.ecommerce.AppConfig;
import com.mrrisoni.ecommerce.daos.ProductDao;
import com.mrrisoni.ecommerce.models.Products;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class BrowseController {

    @RequestMapping(value = "/api/product/boughtwith", method = RequestMethod.GET)
    public List<Products> getFrequentlyBoughtByThis()
    {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        ProductDao prdDao = context.getBean(ProductDao.class);

        return prdDao.frequentlyBoughtWith();
    }

}
