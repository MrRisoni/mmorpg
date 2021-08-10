package com.mrrisoni.mmorpg.controllers;

import com.mrrisoni.mmorpg.dto.general.CharacterDto;
import com.mrrisoni.mmorpg.dto.misc.CharacterCurrencyDto;
import com.mrrisoni.mmorpg.entity.characters.CharacterMdl;
import com.mrrisoni.mmorpg.repositories.CharacterRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
public class CharacterController {

    @Autowired
    CharacterRepository charRepo;

    @Autowired
    ModelMapper modelMapper;

    @RequestMapping(value= "/api/character/currencies" , method = RequestMethod.GET)
    public List<CharacterCurrencyDto> getCurrencies(Long characterId) {
        try {

            Optional<CharacterMdl> charItm = charRepo.findById(4L);
            CharacterMdl charEntity =charItm.orElse(null);
            CharacterDto chardto = modelMapper.map(charEntity, CharacterDto.class);
            return chardto.getCurrencyList();
        }
        catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }

}
