package dto.auctiohouse;

import dto.characters.CharacterDto;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class BidDto {
    private BigDecimal bid_total;
    private CharacterDto person;

    public BigDecimal getBid_total() {
        return bid_total;
    }

    public void setBid_total(BigDecimal bid_total) {
        this.bid_total = bid_total;
    }

    public BidDto(BigDecimal bid_total) {
       this.bid_total = bid_total;
    }

    public CharacterDto getPerson() {
        return person;
    }

    public void setPerson(CharacterDto person) {
        this.person = person;
    }


}
