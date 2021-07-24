const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return dbObj.define('recipe_mats', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            },
            raceId: {
                type: Sequelize.INTEGER,
                field: 'quantity'
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        }
    );
}