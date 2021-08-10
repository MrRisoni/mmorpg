package com.mrrisoni.mmorpg.dto.misc;

import lombok.Data;

@Data
public class CurrencyDto {
    private Long id;
    private String title;

    public CurrencyDto() {
    }

    public CurrencyDto(Long id, String title) {
        this.id = id;
        this.title = title;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;

    }
}