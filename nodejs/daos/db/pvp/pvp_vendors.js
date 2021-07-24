const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return dbObj.define('pvp_vendors', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            },
            title: {
                type: Sequelize.STRING,
                field: 'title'
            },
            currencyId : {
                type: Sequelize.INTEGER,
                field: 'currency_id'
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        }
    )
}