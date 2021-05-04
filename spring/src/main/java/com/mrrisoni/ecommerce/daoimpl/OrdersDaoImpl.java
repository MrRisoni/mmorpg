package com.mrrisoni.ecommerce.daoimpl;

import com.mrrisoni.ecommerce.daos.OrdersDao;
import com.mrrisoni.ecommerce.mappers.OrderItemMapper;
import com.mrrisoni.ecommerce.mappers.OrderMapper;
import com.mrrisoni.ecommerce.mappers.OrderStatusMapper;
import com.mrrisoni.ecommerce.models.OrderItems;
import com.mrrisoni.ecommerce.models.OrderStatus;
import com.mrrisoni.ecommerce.models.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.Collection;

@Component
public class OrdersDaoImpl implements OrdersDao {
    JdbcTemplate jdbcTemplate;

    @Autowired
    public OrdersDaoImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }


    @Override
    public Orders findById(Long id) {

        String sql = "SELECT O.ID AS ORDERID,O.CURRENCY,O.CURRENCY_RATE,O.TOTAL,NET," +
                "O.COURRIERFEES,O.SHIPPING,O.SUCCESS,O.VOID,O.CREATED_AT,O.UPDATED_AT," +
                " S.ID AS SHOPID ,S.TITLE AS SHOP_TITLE," +
                " P.TITLE AS PAY_METHOD_TITLE," +
                " ST.TITLE AS STATUS_TITLE,O.BILLING_ADDRESS_ID,O.SHIPPING_ADDRESS_ID," +
                " BL.ID AS BILL_ID,BL.COUNTRY_CODE AS BILL_COUNTRY_CODE," +
                " BL.MOBILE_PHONE AS BILL_MOBILE_PHONE," +
                " BL.CITY AS BILL_CITY,BL.ADDRESS AS BILL_ADDRESS,BL.STREET_NO AS BILL_STREET_NO "+
                " SHP.COUNTRY_CODE AS SHIP_COUNTRY_CODE, SHP.MOBILE_PHONE AS SHIP_MOBILE_PHONE," +
                " SHP.CITY AS SHIP_CITY,SHP.ADDRESS AS SHIP_ADDRESS,SHP.STREET_NO AS SHIP_STREET_NO " +
                " FROM ORDERS O " +
                " JOIN SHOPS S ON S.ID = O.SHOP_ID " +
                " JOIN ORDER_STATUS ON ST.ID = O.STATUS_ID " +
                " JOIN PAYMENT_METHODS ON P.ID = O.PAYMENT_METHOD_ID " +
                " JOIN BILLING_ADDRESS ON BL.ID = O.BILLING_ADDRESS_ID " +
                " JOIN SHIPPING_ADDRESS ON SHP.ID = O.SHIPPING_ADDRESS_ID " +
                " WHERE O.ID = ?";
        Orders o = jdbcTemplate.queryForObject(sql,new OrderMapper() ,id);
        return o;
    }

    @Override
    public Collection<OrderStatus> findStatusHistory(Long orderId) {
        String sql = "SELECT ST.TITLE,OSH.CREATED_AT FROM ORDERS_STATUS_HISTORY OSH " +
                " JOIN ORDERS O ON OSH.ORDER_ID = O.ID " +
                " JOIN ORDER_STATUS ST ON ST.ID = OSH.STATUS_ID " +
                " WHERE O.ID = ? " +
                " ORDER BY OSH.CREATED_AT DESC";
        return jdbcTemplate.query(sql,new OrderStatusMapper(),orderId);
    }

    @Override
    public Collection<OrderItems> getOrderItems(Long orderId) {
        String sql = "SELECT OI.QUANTITY,OI.TRACKING_NO,OI.DISPATCHED_ON,OI.EXPECTED_ON,OI.ARRIVED_ON," +
                " OI.NET_PRICE, OI.TAXES, OI.GIFT_COST,OI.IS_SUCCESS,OI.IS_VOID,OI.IS_REFUND," +
                " P.PRODUCT_ID,P.TITLE AS PRODUCT_TITLE," +
                " S.TITLE AS STATUS_TITLE " +
                " FROM ORDER_ITEMS OI JOIN ORDERS O ON O.ID = OI.ORDER_ID" +
                "  JOIN PRODUCTS P ON P.ID = OI.PRODUCT_ID " +
                " JOIN ORDERS_STATUS S ON S.ID = OI.STATUS_ID  " +
                " WHERE OI.ID = ? ";

        return jdbcTemplate.query(sql, new OrderItemMapper(),orderId);
    }

    @Override
    public Collection<OrderStatus> findOrderItemStatusHistory(Long itemId) {
        String sql = "SELECT ST.TITLE,OSH.CREATED_AT FROM ORDER_ITEMS_STATUS_HISTORY OISH " +
                " JOIN ORDER_ITEMS  OI ON OISH.ITEM_ID = OI.ID " +
                " JOIN ORDER_STATUS ST ON ST.ID = OISH.STATUS_ID " +
                " WHERE OISH.ITEM_ID = ? " +
                " ORDER BY OISH.CREATED_AT DESC";
        return jdbcTemplate.query(sql,new OrderStatusMapper(),itemId);
    }
}
