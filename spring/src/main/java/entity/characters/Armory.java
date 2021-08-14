package entity.characters;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "armory")
public class Armory implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column
    private int ilvl;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "character_id")
    private CharacterMdl characterObj;

    public Armory() {
    }

    public Armory(Long id, int ilvl) {
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
