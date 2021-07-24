const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return dbObj.define('pvp_vendors_items', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            },
            rankId: {
                type: Sequelize.INTEGER,
                field: 'rank_id'
            },
            season: {
                type: Sequelize.INTEGER,
                field: 'season_id'
            },
            cost: {
                type: Sequelize.INTEGER,
                field: 'cost'
            },
        },
        {
            timestamps: false,
            freezeTableName: true
        }
    )
}