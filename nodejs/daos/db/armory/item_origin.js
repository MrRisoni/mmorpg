const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return dbObj.define('item_origins', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            },
            title: {
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