const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return dbObj.define('armory', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        }
    );
}