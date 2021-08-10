package com.mrrisoni.mmorpg.dto.misc;

import lombok.Data;

@Data
public class CharacterCurrencyDto {
    private Long id;
    private int amount;

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
}