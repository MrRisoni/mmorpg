const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return dbObj.define('reputation_factions_ranks', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            },
            title: {
                type: Sequelize.CHAR,
                field: 'title'
            },
            maxLimit: {
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