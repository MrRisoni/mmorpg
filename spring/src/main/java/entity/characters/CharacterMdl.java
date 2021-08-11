package entity.characters;

import entity.misc.CharacterCurrency;
import entity.misc.Expansion;
import entity.misc.Realm;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Table(name = "characters")
public class CharacterMdl implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column
    private String name;

    @OneToMany(mappedBy = "charObj", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<CharacterCurrency> currencyList = new ArrayList<>();

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "realm_id")
    private Realm realmObj;

    public CharacterMdl() {
    }

    public CharacterMdl(Long id, String name) {
        this.id = id;
        this.name = name;
    }


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

    public Realm getRealmObj() {
        return realmObj;
    }

    public void setRealmObj(Realm realmObj) {
        this.realmObj = realmObj;
    }
}
