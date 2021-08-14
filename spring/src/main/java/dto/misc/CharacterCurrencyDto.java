package dto.misc;

import lombok.Data;

@Data
public class CharacterCurrencyDto {
    private Long id;
    private int amount;
    private ExpansionDto expacObj;
    private CurrencyDto currency;

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

    public ExpansionDto getExpacObj() {
        return expacObj;
    }

    public void setExpacObj(ExpansionDto expacObj) {
        this.expacObj = expacObj;
    }

    public CurrencyDto getCurrency() {
        return currency;
    }

    public void setCurrency(CurrencyDto currency) {
        this.currency = currency;
    }
}