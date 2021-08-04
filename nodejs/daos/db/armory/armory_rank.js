const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return dbObj.define('armory_item_rank', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            },
            rank: {
                type: Sequelize.INTEGER,
                field: 'rank'
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        }
    );
}