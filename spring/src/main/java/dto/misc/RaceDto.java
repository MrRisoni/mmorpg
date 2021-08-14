package dto.misc;

import lombok.Data;

@Data
public class RaceDto {
    private Long id;
    private String title;

    public RaceDto() {
    }

    public RaceDto(Long id, String title) {
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
