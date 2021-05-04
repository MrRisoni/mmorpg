package com.mrrisoni.ecommerce.controllers;

import com.mrrisoni.ecommerce.AppConfig;
import com.mrrisoni.ecommerce.daos.AddressesDao;
import com.mrrisoni.ecommerce.daos.OrdersDao;
import com.mrrisoni.ecommerce.models.OrderItems;
import com.mrrisoni.ecommerce.models.Orders;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrdersController {
    @RequestMapping(value = "/api/orders/{orderId}", method = RequestMethod.GET)
    public Orders getOrderDetails(@PathVariable Long orderId)
    {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        OrdersDao ordDao = context.getBean(OrdersDao.class);

        Orders o = ordDao.findById(orderId);
        o.setStatusHistory(ordDao.findStatusHistory(orderId));
        for (OrderItems itm : o.getItems()) {
            itm.setStatusHistory(ordDao.findOrderItemStatusHistory(itm.getId()));
        }
        return o;
    }
}
