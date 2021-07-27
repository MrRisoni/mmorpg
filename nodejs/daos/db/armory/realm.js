const Sequelize = require('sequelize');

module.exports = function (dbObj) {
    return dbObj.define('realms', {
            id: {
                type: Sequelize.INTEGER.UNSIGNED,
                field: 'id',
                autoIncrement: true,
                primaryKey: true,
            },
            name: {
                type: Sequelize.STRING,
                field: 'name'
            }
        },
        {
            timestamps: false,
            freezeTableName: true
        }
    )
}