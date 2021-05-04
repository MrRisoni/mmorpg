package com.mrrisoni.ecommerce.daos;

import com.mrrisoni.ecommerce.models.OrderItems;
import com.mrrisoni.ecommerce.models.OrderStatus;
import com.mrrisoni.ecommerce.models.Orders;

import java.util.Collection;

public interface OrdersDao {
    Orders findById(Long id);
    Collection<OrderStatus> findStatusHistory(Long orderId);
    Collection<OrderItems> getOrderItems(Long orderId);
    Collection<OrderStatus> findOrderItemStatusHistory(Long itemId);

}
