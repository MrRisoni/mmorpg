package com.mrrisoni.mmorpg.controllers.characters;

import com.mrrisoni.mmorpg.dto.misc.CurrencyDto;
import com.mrrisoni.mmorpg.entity.auctionhouse.AuctionHouseBidding;
import com.mrrisoni.mmorpg.entity.characters.Character;
import com.mrrisoni.mmorpg.entity.misc.Currency;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collection;

@RestController
public class CharacterController {

    @RequestMapping(value= "/api/character/currencies" , method = RequestMethod.GET)
    public ResponseEntity<Collection<CurrencyDto>> getCurrencies(Long characterId) {
        try {
            return null;
        }
        catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }

}
