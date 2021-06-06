package com.mrrisoni.mmorpg.controllers;

import com.mrrisoni.mmorpg.entity.auctionhouse.AuctionHouseBidding;
import org.springframework.http.ResponseEntity;

import java.util.Collection;

public class AuctionHouseController {

    public ResponseEntity<Collection<AuctionHouseBidding>> getBids(Long itemId) {
        try {
            return null;
        }
        catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }

}