package com.mrrisoni.ecommerce.mappers;

import com.mrrisoni.ecommerce.models.BillingAddress;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BillingAddressMapper implements RowMapper<BillingAddress> {
    @Override
    public BillingAddress mapRow(ResultSet rs, int rowNum) throws SQLException {
        BillingAddress  bill = new BillingAddress();

        bill.setId(rs.getLong("BILL_ID"));
        bill.setCountryCode(rs.getString("BILL_COUNTRY_CODE"));
        bill.setCity(rs.getString("BILL_CITY"));
        bill.setPostCode(rs.getString("BILL_POST_CODE"));
        bill.setStreetNo(rs.getString("BILL_STREET_NO"));
        bill.setFullName(rs.getString("BILL_FULNAME"));
        bill.setContactMobile(rs.getString("BILL_MOBILE_PHONE"));
        return bill;
    }
}
