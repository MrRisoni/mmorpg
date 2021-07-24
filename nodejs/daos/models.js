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





const racesMdl = sequelize.define('races', {
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

const classesMdl = sequelize.define('classes', {
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


const recipesMdl = sequelize.define('recipe', {
        id: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'id',
            autoIncrement: true,
            primaryKey: true,
        },
        raceId: {
            type: Sequelize.STRING,
            field: 'title'
        }
    },
    {
        timestamps: false,
        freezeTableName: true
    }
);

const recipeMatsMdl = sequelize.define('recipe_mats', {
        id: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'id',
            autoIncrement: true,
            primaryKey: true,
        },
        raceId: {
            type: Sequelize.INTEGER,
            field: 'quantity'
        }
    },
    {
        timestamps: false,
        freezeTableName: true
    }
);

const characterSlotsMdl = sequelize.define('characher_slots', {
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



const pvpCurrencyMdl = sequelize.define('pvp_currency', {
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

const pvpVendorsMdl = sequelize.define('pvp_vendors', {
        id: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'id',
            autoIncrement: true,
            primaryKey: true,
        },
        title: {
            type: Sequelize.STRING,
            field: 'title'
        },
        currencyId : {
            type: Sequelize.INTEGER,
            field: 'currency_id'
        }
    },
    {
        timestamps: false,
        freezeTableName: true
    }
)

const pvpVendorItemsMdl = sequelize.define('pvp_vendors_items', {
        id: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'id',
            autoIncrement: true,
            primaryKey: true,
        },
         rankId: {
            type: Sequelize.INTEGER,
            field: 'rank_id'
        },
        season: {
            type: Sequelize.INTEGER,
            field: 'season_id'
        },
        cost: {
            type: Sequelize.INTEGER,
            field: 'cost'
        },
    },
    {
        timestamps: false,
        freezeTableName: true
    }
)


const itemStatsMdl = sequelize.define('armor_item_stats', {
    id: {
        type: Sequelize.INTEGER.UNSIGNED,
        field: 'id',
        autoIncrement: true,
        primaryKey: true,
    },
    val: {
        type: Sequelize.INTEGER,
        field: 'val'
    }
},
{
    timestamps: false,
    freezeTableName: true
}
)


const statsMdl = sequelize.define('stats', {
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
)


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