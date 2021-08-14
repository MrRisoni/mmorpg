package entity.auctionhouse;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


@Entity
@Table(name = "auction_listings")
public class AuctionHouseListing implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column
    private int quantity;

    @Column
    private BigDecimal starting_bid_total;

    @Column
    private BigDecimal buyouy_total;

    @Column
    private boolean delisted;

    @Column
    private boolean sold;

    @Column
    private Date created_at;

    @Column
    private Date expires_at;

    public AuctionHouseListing()
    {}

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getStarting_bid_total() {
        return starting_bid_total;
    }

    public void setStarting_bid_total(BigDecimal starting_bid_total) {
        this.starting_bid_total = starting_bid_total;
    }

    public BigDecimal getBuyouy_total() {
        return buyouy_total;
    }

    public void setBuyouy_total(BigDecimal buyouy_total) {
        this.buyouy_total = buyouy_total;
    }

    public boolean isDelisted() {
        return delisted;
    }

    public void setDelisted(boolean delisted) {
        this.delisted = delisted;
    }

    public boolean isSold() {
        return sold;
    }

    public void setSold(boolean sold) {
        this.sold = sold;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getExpires_at() {
        return expires_at;
    }

    public void setExpires_at(Date expires_at) {
        this.expires_at = expires_at;
    }
}