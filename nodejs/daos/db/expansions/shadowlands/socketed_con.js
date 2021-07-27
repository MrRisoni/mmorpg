const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return dbObj.define('sl_covenants', {
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