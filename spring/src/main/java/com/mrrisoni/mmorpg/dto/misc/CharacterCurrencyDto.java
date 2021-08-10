package com.mrrisoni.mmorpg.dto.misc;

import com.mrrisoni.mmorpg.dto.general.CharacterDto;
import lombok.Data;

@Data
public class CharacterCurrencyDto {
    private Long id;
    private int amount;
    private CharacterDto character;

    public CharacterCurrencyDto() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public CharacterDto getCharacter() {
        return character;
    }

    public void setCharacter(CharacterDto character) {
        this.character = character;
    }
}