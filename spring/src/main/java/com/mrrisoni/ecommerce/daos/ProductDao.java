package com.mrrisoni.ecommerce.daos;

import com.mrrisoni.ecommerce.models.Products;
import java.util.List;

public interface ProductDao {
    List<Products> findAll();
    List<Products> frequentlyBoughtWith();
    Products findById(Long id);
}
