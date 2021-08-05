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
            amount: {
                type: Sequelize.INTEGER,
                field: 'tamountitle'
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        }
    );
}