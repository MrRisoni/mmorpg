const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return dbObj.define('armor_item_stats', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            },
            val: {
                type: Sequelize.INTEGER,
                field: 'val'
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        }
    )
}