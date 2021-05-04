package com.mrrisoni.ecommerce.daoimpl;

import com.mrrisoni.ecommerce.daos.AddressesDao;
import com.mrrisoni.ecommerce.mappers.BillingAddressMapper;
import com.mrrisoni.ecommerce.mappers.ShippingAddressMapper;
import com.mrrisoni.ecommerce.models.BillingAddress;
import com.mrrisoni.ecommerce.models.ShippingAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

public class AddressesDaoImpl implements AddressesDao {
    JdbcTemplate jdbcTemplate;

    @Autowired
    public AddressesDaoImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public BillingAddress findBillingAddressById(Long id) {
        return jdbcTemplate.queryForObject("SELECT ID AS BILL_ID,COUNTRY_CODE AS BILL_COUNTRY_CODE," +
                "MOBILE_PHONE AS BILL_MOBILE_PHONE," +
                "CITY AS BILL_CITY,ADDRESS AS BILL_ADDRESS,STREET_NO AS BILL_STREET_NO" +
                " FROM BILLING_ADDRESSES WHERE ID = ? ", new BillingAddressMapper(),id);
    }

    @Override
    public ShippingAddress findShippingAddressById(Long id) {
        return jdbcTemplate.queryForObject("SELECT ID AS SHIP_ID,COUNTRY_CODE AS SHIP_COUNTRY_CODE," +
                "MOBILE_PHONE AS SHIP_MOBILE_PHONE," +
                "CITY AS SHIP_CITY,ADDRESS AS SHIP_ADDRESS,STREET_NO AS SHIP_STREET_NO" +
                " FROM SHIPPING_ADDRESSES WHERE ID = ? ", new ShippingAddressMapper(),id);

    }
}
