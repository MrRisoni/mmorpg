package com.mrrisoni.ecommerce.daos;

import com.mrrisoni.ecommerce.models.BillingAddress;
import com.mrrisoni.ecommerce.models.ShippingAddress;

public interface AddressesDao {
    BillingAddress findBillingAddressById(Long id);
    ShippingAddress findShippingAddressById(Long id);
}
