package com.mrrisoni.ecommerce.daoimpl;

import com.mrrisoni.ecommerce.daos.ProductDao;
import com.mrrisoni.ecommerce.mappers.FrequentProductMapper;
import com.mrrisoni.ecommerce.mappers.ProductMapper;
import com.mrrisoni.ecommerce.mappers.ReviewMapper;
import com.mrrisoni.ecommerce.models.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.List;

@Component
public class ProductDaoImpl implements ProductDao {

    JdbcTemplate jdbcTemplate;

    @Autowired
    public ProductDaoImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<Products> findAll() {
        return jdbcTemplate.query("SELECT ID,TITLE,THUMBNAIL FROM PRODUCTS", new ProductMapper());
    }

    public Products  findById(Long id) {
        String productSql = "SELECT ID,TITLE,THUMBNAIL FROM Products WHERE id = ?";
        Products p = jdbcTemplate.queryForObject(productSql,new ProductMapper(),id);

        String reviewsSQL = "SELECT ID,COMMENTS,CREATED_AT,STARS FROM PRODUCT_REVIEWS";
        reviewsSQL = "SELECT * FROM PRODUCT_REVIEWS ORDER BY CREATED_AT DESC";
        p.setReviews(jdbcTemplate.query(reviewsSQL, new ReviewMapper()));
        return p;
    }

    public List<Products> frequentlyBoughtWith() {
        String sql = " SELECT oi2.PRODUCT_ID ,p.TITLE,p.THUMBNAIL " +
                    " FROM ORDER_ITEMS oi2  " +
                    " JOIN ORDER_ITEMS oi1 ON oi1.ORDER_ID = oi2.ORDER_ID   " +
                    " JOIN PRODUCTS p ON p.ID = oi2.PRODUCT_ID   " +
                    " WHERE  oi1.PRODUCT_ID = 1   " +
                    " AND oi2.PRODUCT_ID != 1 AND ROWNUM <= 3  " + 
                    " GROUP BY  oi2.PRODUCT_ID,p.TITLE,p.THUMBNAIL " +
                    " ORDER BY COUNT(oi2.ID) DESC";
        return jdbcTemplate.query(sql, new FrequentProductMapper());
    }
}
