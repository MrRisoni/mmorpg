const Sequelize = require('sequelize');
const gems = require('./db/buffs/gems');


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
var gemsMdl = require("./db/buffs/gems")(sequelize);

var enchantedMdl = require("./db/buffs/enchanted")(sequelize);
var gemmedMdl = require("./db/buffs/gemmed")(sequelize);

var auctionHouseListingMdl = require("./db/ah/ah_listing")(sequelize);
var auctionHouseBiddingMdl = require("./db/ah/ah_bid")(sequelize);
var itemsMdl = require("./db/armory/items")(sequelize);
var charactersMdl = require("./db/armory/characters")(sequelize);
var racesMdl = require("./db/armory/races")(sequelize);
var factionsMdl = require("./db/armory/factions")(sequelize);

var classesMdl = require("./db/armory/classes")(sequelize);
var characterSlotsMdl = require("./db/armory/character_slots")(sequelize);
var statsMdl = require("./db/armory/stats")(sequelize);
var realmsMdl = require("./db/armory/realm")(sequelize);

var armoryMdl = require("./db/armory/armory")(sequelize);

var itemOrigins = require("./db/armory/item_origin")(sequelize);
var itemTitles = require("./db/armory/item_titles")(sequelize);
var armoryRankMdl = require("./db/armory/armory_rank")(sequelize);


var recipesMdl = require("./db/professions/recipes")(sequelize);
var recipeMatsMdl = require("./db/professions/recipe_mats")(sequelize);

var pvpVendorsMdl = require("./db/pvp/pvp_vendors")(sequelize);
var pvpVendorItemsMdl = require("./db/pvp/pvp_vendor_item")(sequelize);
var itemStatsMdl = require("./db/armory/item_stats")(sequelize);
var pvpCurrencyMdl = require("./db/pvp/pvp_currency")(sequelize);

var transmogMdl = require("./db/armory/transmog")(sequelize);

// reputations
var reputationCharacterMdl =   require("./db/reputations/reputation_character")(sequelize);
var reputationFactionsMdl =   require("./db/reputations/reputation_factions")(sequelize);
var reputationRanksMdl =   require("./db/reputations/reputation_ranks")(sequelize);


// dungeons begin
var raidsMdl = require("./db/dungeons/raids")(sequelize);
var bossesMdl = require("./db/dungeons/bosses")(sequelize);
var tierSetsMdl = require("./db/dungeons/tier_sets")(sequelize);
var tierSetPiecesMdl = require("./db/dungeons/tier_set_pieces")(sequelize);
// dungeons end

// shadowlands begin
var SL_CovenantsMdl = require("./db/expansions/shadowlands/covenants")(sequelize);
var SL_SoulbindsMdl=  require("./db/expansions/shadowlands/soulbinds")(sequelize);
var SL_ConduitsMdl =  require("./db/expansions/shadowlands/conduits")(sequelize);
// shadowlands end

reputationCharacterMdl.belongsTo(charactersMdl, {foreignKey: 'character_id', as: 'charObj'});
reputationCharacterMdl.belongsTo(reputationFactionsMdl, {foreignKey: 'faction_id', as: 'factionObj'});
reputationCharacterMdl.belongsTo(reputationRanksMdl, {foreignKey: 'rank_id', as: 'factionRankObj'});


auctionHouseListingMdl.belongsTo(itemsMdl, {foreignKey: 'item_id', as: 'itemObj'});
auctionHouseListingMdl.belongsTo(charactersMdl, {foreignKey: 'character_id', as: 'sellerObj'});

auctionHouseListingMdl.hasMany(auctionHouseBiddingMdl, {foreignKey: 'listing_id', as: 'bidsListObj'});

charactersMdl.belongsTo(racesMdl, {foreignKey: 'race_id', as: 'raceObj'});
charactersMdl.belongsTo(factionsMdl, {foreignKey: 'faction_id', as: 'factionObj'});

charactersMdl.belongsTo(classesMdl, {foreignKey: 'race_id', as: 'classObj'});
charactersMdl.belongsTo(realmsMdl, {foreignKey: 'realm_id', as: 'realmObj'});
charactersMdl.hasMany(armoryMdl, {foreignKey: 'character_id', as: 'armoryList'});

armoryMdl.belongsTo(characterSlotsMdl, {foreignKey: 'slot_id', as: 'slotObj'});
armoryMdl.belongsTo(itemsMdl, {foreignKey: 'item_id', as: 'itemSlotObj'});

itemStatsMdl.belongsTo(statsMdl, {foreignKey: 'stat_id', as: 'statObj'});


armoryMdl.hasMany(enchantedMdl, {foreignKey: 'armory_id', as: 'enchantedObj'});
enchantedMdl.belongsTo(enchantsMdl, {foreignKey: 'enchant_id', as: 'enchantObj'});

armoryMdl.hasMany(gemmedMdl, {foreignKey: 'armory_id', as: 'gemmedObj'});
gemmedMdl.belongsTo(gemsMdl, {foreignKey: 'gem_id', as: 'gemObj'});

itemsMdl.hasMany(itemTitles, {foreignKey: 'item_id', as: 'titleObj'});
itemTitles.belongsTo(itemOrigins, {foreignKey: 'title_id', as: 'originObj'});

armoryMdl.hasMany(transmogMdl, {foreignKey: 'original_item_id', as: 'transmogObj'});
transmogMdl.belongsTo(itemsMdl, {foreignKey: 'transmoged_to_id', as: 'tranmoggedObj'});

armoryMdl.hasMany(armoryRankMdl, {foreignKey: 'armory_id', as: 'rankItemObj'});


tierSetsMdl.hasMany(tierSetPiecesMdl, {foreignKey: 'tier_set_id', as: 'pieceObj'});
tierSetPiecesMdl.belongsTo(itemsMdl, {foreignKey: 'item_id', as: 'tierPieceObj'});
tierSetPiecesMdl.belongsTo(characterSlotsMdl, {foreignKey: 'slot_id', as: 'tierPieceSlotObj'});


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
    enchantsMdl,
    realmsMdl,
    armoryMdl,
    gemsMdl,
    enchantedMdl,
    gemmedMdl,
    itemOrigins,
    itemTitles,
    transmogMdl,
    tierSetsMdl,
    bossesMdl,
    raidsMdl,
    tierSetPiecesMdl,
    armoryRankMdl,
    factionsMdl,
    reputationRanksMdl,
    reputationFactionsMdl,
    reputationCharacterMdl



};