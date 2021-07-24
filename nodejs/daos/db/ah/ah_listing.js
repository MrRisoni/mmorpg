const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return  dbObj.define('auction_listings', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            },
            itemId: {
                type: Sequelize.INTEGER,
                field: 'item_id'
            },
            quantity: {
                type: Sequelize.INTEGER,
                field: 'quantity'
            },
            startingBidTotal: {
                type: Sequelize.FLOAT,
                field: 'starting_bid_total'
            },
            startingBidGold: {
                type: Sequelize.INTEGER,
                field: 'starting_bid_g'
            },
            startingBidSilver: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'starting_bid_s'
            },
            startingBidCopper: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'starting_bid_c'
            },
            buyoutTotal: {
                type: Sequelize.FLOAT,
                field: 'buyout_total'
            },
            buyoutGold: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'buyout_g'
            },
            buyoutSilver: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'buyout_s'
            },
            buyoutCopper: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'buyout_c'
            },
            delisted: {
                type: Sequelize.BOOLEAN,
                field: 'delisted'
            },
            sold: {
                type: Sequelize.BOOLEAN,
                field: 'sold'
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        }
    );
}
