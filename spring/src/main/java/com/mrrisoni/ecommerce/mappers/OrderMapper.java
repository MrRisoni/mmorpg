package com.mrrisoni.ecommerce.mappers;

import com.mrrisoni.ecommerce.models.*;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderMapper  implements RowMapper<Orders> {
    @Override
    public Orders mapRow(ResultSet rs, int rowNum) throws SQLException {
        Orders ordObj = new Orders();

        ordObj.setId(rs.getLong("ORDERID"));
        ordObj.setCurrency(rs.getString("CURRENCY"));
        ordObj.setCurrency_rate(rs.getBigDecimal("CURRENCY_RATE"));
        ordObj.setTotal(rs.getBigDecimal("TOTAL"));
        ordObj.setNet(rs.getBigDecimal("NET"));
        ordObj.setCourrierFees(rs.getBigDecimal("COURRIERFEES"));
        ordObj.setShipping(rs.getBigDecimal("SHIPPING"));
        ordObj.setSuccess(rs.getBoolean("SUCCESS"));
        ordObj.setVoid(rs.getBoolean("VOID"));
        ordObj.setCreatedAt(rs.getTimestamp("CREATED_AT"));
        ordObj.setUpdatedAt(rs.getTimestamp("UPDATED_AT"));

        Shop shopObj = new Shop();
        shopObj.setId(rs.getLong("SHOPID"));
        shopObj.setTitle(rs.getString("SHOP_TITLE"));

        OrderStatus ordSts = new OrderStatus();
        ordSts.setTitle(rs.getString("STATUS_TITLE"));

        PaymentMethod pm = new PaymentMethod();
        pm.setTitle(rs.getString("PAY_METHOD_TITLE"));
        ordObj.setShop(shopObj);
        ordObj.setCurrentStatus(ordSts);

        ordObj.setBillAddressId(rs.getLong("BILLING_ADDRESS_ID"));
        ordObj.setShipAddressId(rs.getLong("SHIPPING_ADDRESS_ID"));

        BillingAddress bill = new BillingAddress();

        bill.setId(rs.getLong("BILL_ID"));
        bill.setCountryCode(rs.getString("BILL_COUNTRY_CODE"));
        bill.setCity(rs.getString("BILL_CITY"));
        bill.setPostCode(rs.getString("BILL_POST_CODE"));
        bill.setStreetNo(rs.getString("BILL_STREET_NO"));
        bill.setFullName(rs.getString("BILL_FULNAME"));
        bill.setContactMobile(rs.getString("BILL_MOBILE_PHONE"));

        ShippingAddress ship = new ShippingAddress();

        ship.setId(rs.getLong("SHIP_ID"));
        ship.setCountryCode(rs.getString("SHIP_COUNTRY_CODE"));
        ship.setCity(rs.getString("SHIP_CITY"));
        ship.setPostCode(rs.getString("SHIP_POST_CODE"));
        ship.setStreetNo(rs.getString("SHIP_STREET_NO"));
        ship.setFullName(rs.getString("SHIP_FULNAME"));
        ship.setContactMobile(rs.getString("SHIP_MOBILE_PHONE"));

        ordObj.setBillAddress(bill);
        ordObj.setShipAddress(ship);
        return ordObj;
    }
}
