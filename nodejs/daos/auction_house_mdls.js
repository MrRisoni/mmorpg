module.exports = function (sequelize, DataTypes) {

    return sequelize.define('auction_bids_history', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            },
            listingId: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'listing_id'
            },
            bidTotal: {
                type: Sequelize.FLOAT,
                field: 'bid_total'
            },
            bidGold: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'bid_g'
            },
            bidSilver: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'bid_s'
            },
            bidCopper: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'bid_c'
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        }
    )
}