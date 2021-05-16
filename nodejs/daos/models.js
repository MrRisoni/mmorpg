var MYSQL_NAME = process.env.SPRING_APP_DB_ECOMMERCE_USR;
var MYSQL_PASSWD = process.env.SPRING_APP_DB_ECOMMERCE_PASSWD;
var MYSQL_HOST = process.env.SPRING_APP_DB_ECOMMERCE_HOST;
var MYSQL_DB= 'mmorpg_db';

const Sequelize = require('sequelize');


const sequelize = new Sequelize(MYSQL_DB, MYSQL_NAME, MYSQL_PASSWD, {
    host: MYSQL_HOST,
    dialect: 'mysql',
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    },
    logging: true
});

sequelize
    .authenticate()
    .then(() => {
        console.log('Connection has been established successfully.');
    })
    .catch(err => {
        console.error('Unable to connect to the database:', err);
    });



const itemsMdl = sequelize.define('items', {
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



const charactersMdl = sequelize.define('characters', {
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


const auctionHouseListingMdl = sequelize.define('auction_listings', {
    id: {
        type: Sequelize.INTEGER.UNSIGNED,
        field: 'id',
        autoIncrement: true,
        primaryKey: true,
    },
    itemId: {
        type: Sequelize.INTEGER.UNSIGNED,
        field: 'item_id'
    },
    startingBidTotal: {
        type: Sequelize.FLOAT,
        field: 'starting_bid_total'
    }
},
{
    timestamps: false,
    freezeTableName: true
}
);

auctionHouseListingMdl.belongsTo(itemsMdl, {foreignKey: 'item_id', as: 'itemObj'});
auctionHouseListingMdl.belongsTo(charactersMdl, {foreignKey: 'character_id', as: 'sellerObj'});

module.exports = {
    dbObj: sequelize,
    auctionHouseListingMdl,
    itemsMdl,
    charactersMdl
};


