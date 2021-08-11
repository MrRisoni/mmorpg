package dto.characters;

import dto.misc.CharacterCurrencyDto;
import dto.misc.RealmDto;
import lombok.Data;

import java.util.List;

@Data
public class CharacterDto {
    private Long id;
    private String name;
    private List<CharacterCurrencyDto> currencyList;
    private RealmDto realm;

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

    public CharacterDto(){};

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

    public RealmDto getRealm() {
        return realm;
    }

    public void setRealm(RealmDto realm) {
        this.realm = realm;
    }
}
