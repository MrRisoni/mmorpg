package entity.characters;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "armory_gems")
public class ArmoryGemMdl implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "armory_id")
    private Armory armoryObj;


    public ArmoryGemMdl(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

}
