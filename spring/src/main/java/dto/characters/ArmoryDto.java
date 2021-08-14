package dto.characters;

import lombok.Data;

@Data
public class ArmoryDto {
    private Long id;
    private int ilvl;

    public ArmoryDto() {
    }

    public ArmoryDto(Long id, int ilvl) {
        this.id = id;
        this.ilvl = ilvl;
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
}
