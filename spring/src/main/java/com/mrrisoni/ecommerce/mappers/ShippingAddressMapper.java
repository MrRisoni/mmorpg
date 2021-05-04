package com.mrrisoni.ecommerce.mappers;

import com.mrrisoni.ecommerce.models.ShippingAddress;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ShippingAddressMapper implements RowMapper<ShippingAddress> {
    @Override
    public ShippingAddress mapRow(ResultSet rs, int rowNum) throws SQLException {
        ShippingAddress ship = new ShippingAddress();

        ship.setId(rs.getLong("SHIP_ID"));
        ship.setCountryCode(rs.getString("SHIP_COUNTRY_CODE"));
        ship.setCity(rs.getString("SHIP_CITY"));
        ship.setPostCode(rs.getString("SHIP_POST_CODE"));
        ship.setStreetNo(rs.getString("SHIP_STREET_NO"));
        ship.setFullName(rs.getString("SHIP_FULNAME"));
        ship.setContactMobile(rs.getString("SHIP_MOBILE_PHONE"));
        return ship;
    }
}

