const Sequelize = require('sequelize');


var MYSQL_NAME = process.env.SPRING_APP_DB_ECOMMERCE_USR;
var MYSQL_PASSWD = process.env.SPRING_APP_DB_ECOMMERCE_PASSWD;
var MYSQL_HOST = process.env.SPRING_APP_DB_ECOMMERCE_HOST;
var MYSQL_DB = 'mmorpg_db';


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


const racesClassesMdl = sequelize.define('race_class_combo', {
        id: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'id',
            autoIncrement: true,
            primaryKey: true,
        },
        raceId: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'race_id'
        }
    },
    {
        timestamps: false,
        freezeTableName: true
    }
);


var enchantsMdl = require("./db/buffs/enchants")(sequelize);
var auctionHouseListingMdl = require("./db/ah/ah_listing")(sequelize);
var auctionHouseBiddingMdl = require("./db/ah/ah_bid")(sequelize);

auctionHouseListingMdl.belongsTo(itemsMdl, {foreignKey: 'item_id', as: 'itemObj'});
auctionHouseListingMdl.belongsTo(charactersMdl, {foreignKey: 'character_id', as: 'sellerObj'});

auctionHouseListingMdl.hasMany(auctionHouseBiddingMdl, {foreignKey: 'listing_id', as: 'bidsListObj'});


racesClassesMdl.belongsTo(racesMdl, {foreignKey: 'race_id', as: 'raceObj'});
racesClassesMdl.belongsTo(classesMdl, {foreignKey: 'class_id', as: 'classObj'});

recipesMdl.hasMany(recipeMatsMdl, {foreignKey: 'recipe_id', as: 'recipeObj'});
//itemsMdl.belongsTo(recipeMatsMdl, {foreignKey: 'item_id', as: 'itemMatObj'});

// PvP Begin
pvpVendorsMdl.hasMany(pvpVendorItemsMdl, {foreignKey: 'vendor_id', as: 'itemsList'});
pvpVendorItemsMdl.belongsTo(itemsMdl, {foreignKey: 'item_id',primaryKey:'id', as: 'itemPvpObj'});
itemsMdl.hasMany(itemStatsMdl, {foreignKey: 'item_id', as: 'itemStatsObj'});

// PvP end



module.exports = {
    dbObj: sequelize,
    auctionHouseListingMdl,
    itemsMdl,
    charactersMdl,
    auctionHouseBiddingMdl,
    racesMdl,
    classesMdl,
    racesClassesMdl,
    recipesMdl,
    recipeMatsMdl,
    pvpCurrencyMdl,
    characterSlotsMdl,
    pvpVendorsMdl,
    pvpVendorItemsMdl,
    itemStatsMdl,
    statsMdl,
    enchantsMdl


};