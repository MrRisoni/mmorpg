const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return dbObj.define('armory', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            },
            ilvl: {
                type: Sequelize.INTEGER,
                field: 'ilvl'
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        }
    );
}