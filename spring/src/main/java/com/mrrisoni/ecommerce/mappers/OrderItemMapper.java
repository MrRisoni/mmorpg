package com.mrrisoni.ecommerce.mappers;

import com.mrrisoni.ecommerce.models.OrderItems;
import com.mrrisoni.ecommerce.models.OrderStatus;
import com.mrrisoni.ecommerce.models.Orders;
import com.mrrisoni.ecommerce.models.Products;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderItemMapper implements RowMapper<OrderItems> {
    @Override
    public OrderItems mapRow(ResultSet rs, int rowNum) throws SQLException {
        OrderItems itmObj = new OrderItems();

        itmObj.setQuantity(rs.getInt("QUANTITY"));
        itmObj.setTrackingNo(rs.getString("TRACKING_NO"));
        itmObj.setNetPrice(rs.getBigDecimal("NET_PRICE"));
        itmObj.setTaxes(rs.getBigDecimal("TAXES"));
        itmObj.setGiftCost(rs.getBigDecimal("GIFT_COST"));
        itmObj.setSuccess(rs.getBoolean("IS_SUCCESS"));
        itmObj.setVoid(rs.getBoolean("IS_VOID"));
        itmObj.setRefund(rs.getBoolean("IS_REFUND"));
        itmObj.setDispatchedOn(rs.getDate("DISPATCHED_ON"));
        itmObj.setExpectedOn(rs.getDate("EXPECTED_ON"));
        itmObj.setArrivedOn(rs.getDate("ARRIVED_ON"));

        Products prodObj = new Products();
        prodObj.setId(rs.getLong("PRODUCT_ID"));
        prodObj.setTitle(rs.getString("PRODUCT_TITLE"));

        OrderStatus osts = new OrderStatus();
        osts.setTitle(rs.getString("STATUS_TITLE"));

        itmObj.setProduct(prodObj);
        itmObj.setStatus(osts);

        return itmObj;
    }
}
