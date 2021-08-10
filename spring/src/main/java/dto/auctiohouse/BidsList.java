package dto.auctiohouse;

import dto.general.ItemDto;
import lombok.Data;

import java.util.Collection;

@Data
public class BidsList {
    private ItemDto item;
    private Collection<BidDto> bids;

    public BidsList() {
    }

    public ItemDto getItem() {
        return item;
    }

    public void setItem(ItemDto item) {
        this.item = item;
    }

    public Collection<BidDto> getBids() {
        return bids;
    }

    public void setBids(Collection<BidDto> bids) {
        this.bids = bids;
    }
}
