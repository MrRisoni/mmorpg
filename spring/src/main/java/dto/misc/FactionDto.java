package dto.misc;

import lombok.Data;

@Data
public class FactionDto {
    private Long id;
    private String title;

    public FactionDto() {
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
