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
        quantity: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'quantity'
        },
        startingBidTotal: {
            type: Sequelize.FLOAT,
            field: 'starting_bid_total'
        },
        startingBidGold: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'starting_bid_g'
        },
        startingBidSilver: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'starting_bid_s'
        },
        startingBidCopper: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'starting_bid_c'
        },
        buyoutTotal: {
            type: Sequelize.FLOAT,
            field: 'buyout_total'
        },
        buyoutGold: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'buyout_g'
        },
        buyoutSilver: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'buyout_s'
        },
        buyoutCopper: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'buyout_c'
        },
        delisted: {
            type: Sequelize.BOOLEAN,
            field: 'delisted'
        },
        sold: {
            type: Sequelize.BOOLEAN,
            field: 'sold'
        }
    },
    {
        timestamps: false,
        freezeTableName: true
    }
);


const auctionHouseBiddingMdl = sequelize.define('auction_bids_history', {
        id: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'id',
            autoIncrement: true,
            primaryKey: true,
        },
        listingId: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'listing_id'
        },
        bidTotal: {
            type: Sequelize.FLOAT,
            field: 'bid_total'
        },
        bidGold: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'bid_g'
        },
        bidSilver: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'bid_s'
        },
        bidCopper: {
            type: Sequelize.INTEGER.UNSIGNED,
            field: 'bid_c'
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


auctionHouseListingMdl.belongsTo(itemsMdl, {foreignKey: 'item_id', as: 'itemObj'});
auctionHouseListingMdl.belongsTo(charactersMdl, {foreignKey: 'character_id', as: 'sellerObj'});

auctionHouseListingMdl.hasMany(auctionHouseBiddingMdl, {foreignKey: 'listing_id', as: 'bidsListObj'});

racesClassesMdl.belongsTo(racesMdl, {foreignKey: 'race_id', as: 'raceObj'});
racesClassesMdl.belongsTo(classesMdl, {foreignKey: 'class_id', as: 'classObj'});

recipesMdl.hasMany(recipeMatsMdl, {foreignKey: 'recipe_id', as: 'recipeObj'});
itemsMdl.belongsTo(recipeMatsMdl, {foreignKey: 'item_id', as: 'itemObj'});

// PvP Begin
pvpVendorsMdl.hasMany(pvpVendorItemsMdl, {foreignKey: 'vendor_id', as: 'itemsList'});

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
    statsMdl


};