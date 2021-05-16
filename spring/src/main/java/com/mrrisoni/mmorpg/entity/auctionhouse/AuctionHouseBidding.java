package com.mrrisoni.mmorpg.entity.auctionhouse;

import lombok.Data;

import javax.persistence.*;


@Data
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


    public AuctionHouseBidding() {
    }




}

