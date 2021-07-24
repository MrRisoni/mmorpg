const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return dbObj.define('characters', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            },
            title: {
                type: Sequelize.CHAR,
                field: 'name'
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        }
    );
}