package hql;

import entity.HibernateUtil;

public class AuctionHouseRepo extends Repository{

    public AuctionHouseRepo() {
        this.setEntityManager(HibernateUtil.getEM());
    }
}
