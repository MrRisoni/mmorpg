package entity.auctionhouse;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "auction_bids_history")
public class AuctionHouseBidding implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column
    private BigDecimal bid_total;

    @Column
    private BigDecimal bid_g;

    @Column
    private BigDecimal bid_s;

    @Column
    private BigDecimal bid_c;

    @Column
    private boolean active;

    @Column
    private Date created_at;

    public AuctionHouseBidding() {
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BigDecimal getBid_total() {
        return bid_total;
    }

    public void setBid_total(BigDecimal bid_total) {
        this.bid_total = bid_total;
    }

    public BigDecimal getBid_g() {
        return bid_g;
    }

    public void setBid_g(BigDecimal bid_g) {
        this.bid_g = bid_g;
    }

    public BigDecimal getBid_s() {
        return bid_s;
    }

    public void setBid_s(BigDecimal bid_s) {
        this.bid_s = bid_s;
    }

    public BigDecimal getBid_c() {
        return bid_c;
    }

    public void setBid_c(BigDecimal bid_c) {
        this.bid_c = bid_c;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
}

