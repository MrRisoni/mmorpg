package com.mrrisoni.mmorpg.hql;

import com.mrrisoni.mmorpg.entity.HibernateUtil;

public class AuctionHouseRepo extends Repository{

    public AuctionHouseRepo() {
        this.setEntityManager(HibernateUtil.getEM());
    }
}
