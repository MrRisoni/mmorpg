package com.mrrisoni.ecommerce.mappers;

import com.mrrisoni.ecommerce.models.OrderStatus;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderStatusMapper implements RowMapper<OrderStatus> {
    @Override
    public OrderStatus mapRow(ResultSet rs, int rowNum) throws SQLException {
        OrderStatus ordStatusObj = new OrderStatus();

        ordStatusObj.setTitle(rs.getString("TITLE"));
        ordStatusObj.setCreatedAt(rs.getTimestamp(""));
        return ordStatusObj;
    }

}
