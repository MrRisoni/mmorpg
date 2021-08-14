package entity.characters;

import entity.general.Item;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;

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

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "slot_id")
    private SlotMdl slotObj;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_id")
    private Item itemObj;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "armoryObj", fetch = FetchType.LAZY)
    private Collection<ArmoryGemMdl> gemmedCollection;

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

    public SlotMdl getSlotObj() {
        return slotObj;
    }

    public void setSlotObj(SlotMdl slotObj) {
        this.slotObj = slotObj;
    }

    public Item getItemObj() {
        return itemObj;
    }

    public void setItemObj(Item itemObj) {
        this.itemObj = itemObj;
    }

    public Collection<ArmoryGemMdl> getGemmedCollection() {
        return gemmedCollection;
    }

    public void setGemmedCollection(Collection<ArmoryGemMdl> gemmedCollection) {
        this.gemmedCollection = gemmedCollection;
    }
}
