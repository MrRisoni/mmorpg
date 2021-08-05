const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return dbObj.define('reputation_faction_character', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            },
            amount: {
                type: Sequelize.INTEGER,
                field: 'amount'
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        }
    );
}