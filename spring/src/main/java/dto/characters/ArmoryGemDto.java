package dto.characters;

import lombok.Data;

@Data
public class ArmoryGemDto {
    private Long id;

    public ArmoryGemDto() {
    }

    public ArmoryGemDto(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
