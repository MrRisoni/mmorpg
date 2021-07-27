const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return dbObj.define('sl_covenant_soulbinds', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            },
            raceId: {
                type: Sequelize.STRING,
                field: 'title'
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        }
    );
}