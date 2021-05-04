package com.mrrisoni.ecommerce.mappers;

import com.mrrisoni.ecommerce.models.Reviews;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReviewMapper implements RowMapper<Reviews> {
    @Override
    public Reviews mapRow(ResultSet rs, int rowNum) throws SQLException {
        Reviews rvw = new Reviews();
        rvw.setId(rs.getLong("ID"));
        rvw.setComment(rs.getString("COMMENTS"));
        rvw.setCreatedAt(rs.getTimestamp("CREATED_AT"));
        rvw.setStars(rs.getBigDecimal("STARS"));
        return rvw;
    }
}
