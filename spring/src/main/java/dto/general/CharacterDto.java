package dto.general;

import dto.misc.CharacterCurrencyDto;
import lombok.Data;

import java.util.List;

@Data
public class CharacterDto {
    private Long id;
    private String name;
    private List<CharacterCurrencyDto> currencyList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public CharacterDto(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    public List<CharacterCurrencyDto> getCurrencyList() {
        return currencyList;
    }

    public void setCurrencyList(List<CharacterCurrencyDto> currencyList) {
        this.currencyList = currencyList;
    }
}
