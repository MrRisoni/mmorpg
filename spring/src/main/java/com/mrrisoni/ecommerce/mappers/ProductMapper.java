package com.mrrisoni.ecommerce.mappers;

import com.mrrisoni.ecommerce.models.Products;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductMapper implements RowMapper<Products> {
    @Override
    public Products mapRow(ResultSet rs, int rowNum) throws SQLException {
        Products prd = new Products();

        prd.setId(rs.getLong("ID"));
        prd.setTitle(rs.getString("TITLE"));
        prd.setCode(rs.getString("THUMBNAIL"));
        return prd;
    }
}
