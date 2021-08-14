package dto.characters;

import dto.general.ItemDto;
import lombok.Data;

import java.util.Collection;

@Data
public class ArmoryDto {
    private Long id;
    private int ilvl;
    private SlotDto slotObj;
    private ItemDto itemObj;
    private Collection<ArmoryGemDto> gemmedCollection;

    public ArmoryDto() {
    }

    public ArmoryDto(Long id, int ilvl, SlotDto slotObj, ItemDto itemObj, Collection<ArmoryGemDto> gemmedCollection) {
        this.id = id;
        this.ilvl = ilvl;
        this.slotObj = slotObj;
        this.itemObj = itemObj;
        this.gemmedCollection = gemmedCollection;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getIlvl() {
        return ilvl;
    }

    public void setIlvl(int ilvl) {
        this.ilvl = ilvl;
    }

    public SlotDto getSlotObj() {
        return slotObj;
    }

    public void setSlotObj(SlotDto slotObj) {
        this.slotObj = slotObj;
    }

    public ItemDto getItemObj() {
        return itemObj;
    }

    public void setItemObj(ItemDto itemObj) {
        this.itemObj = itemObj;
    }

    public Collection<ArmoryGemDto> getGemmedCollection() {
        return gemmedCollection;
    }

    public void setGemmedCollection(Collection<ArmoryGemDto> gemmedCollection) {
        this.gemmedCollection = gemmedCollection;
    }
}
