package com.mrrisoni.mmorpg.entity.auctionhouse;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Data
@Entity
@Table(name = "auction_categories")
public class AuctionHouseCategory  implements Serializable {

}
