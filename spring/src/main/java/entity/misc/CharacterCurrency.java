package entity.misc;

import entity.characters.CharacterMdl;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "character_currencies")
public class CharacterCurrency implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "currency_id")
    private Currency currencyObj;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "expansion_id")
    private Expansion expacObj;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "character_id", nullable = false)
    private CharacterMdl charObj;


    @Column
    private int amount;

    public CharacterCurrency() {
    }

    public CharacterCurrency(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public CharacterMdl getCharacterObj() {
        return charObj;
    }

    public void setCharacterObj(CharacterMdl characterObj) {
        this.charObj = characterObj;
    }

    public Currency getCurrencyObj() {
        return currencyObj;
    }

    public void setCurrencyObj(Currency currencyObj) {
        this.currencyObj = currencyObj;
    }

    public Expansion getExpacObj() {
        return expacObj;
    }

    public void setExpacObj(Expansion expacObj) {
        this.expacObj = expacObj;
    }
}