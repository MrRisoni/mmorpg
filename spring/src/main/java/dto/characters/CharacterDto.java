package dto.characters;

import dto.misc.*;
import lombok.Data;

import java.util.Collection;
import java.util.List;

@Data
public class CharacterDto {
    private Long id;
    private String name;
    private List<CharacterCurrencyDto> currencyList;
    private RealmDto realm;
    private RaceDto race;
    private ClassDto classObj;
    private FactionDto factionObj;
    private Collection<ArmoryDto> armoryCollection;

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

    public CharacterDto(Long id, String name, List<CharacterCurrencyDto> currencyList, RealmDto realm, RaceDto race, ClassDto classObj, FactionDto factionObj, Collection<ArmoryDto> armoryCollection) {
        this.id = id;
        this.name = name;
        this.currencyList = currencyList;
        this.realm = realm;
        this.race = race;
        this.classObj = classObj;
        this.factionObj = factionObj;
        this.armoryCollection = armoryCollection;
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

    public RaceDto getRace() {
        return race;
    }

    public void setRace(RaceDto race) {
        this.race = race;
    }

    public ClassDto getClassObj() {
        return classObj;
    }

    public void setClassObj(ClassDto classObj) {
        this.classObj = classObj;
    }

    public FactionDto getFactionObj() {
        return factionObj;
    }

    public void setFactionObj(FactionDto factionObj) {
        this.factionObj = factionObj;
    }

    public Collection<ArmoryDto> getArmoryCollection() {
        return armoryCollection;
    }

    public void setArmoryCollection(Collection<ArmoryDto> armoryCollection) {
        this.armoryCollection = armoryCollection;
    }
}
