const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return  dbObj.define('items', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            },
            title: {
                type: Sequelize.CHAR,
                field: 'title'
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        }
    );
}