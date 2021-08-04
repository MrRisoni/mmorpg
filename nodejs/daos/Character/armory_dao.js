const dbObj = require('./../models');


function  getArmory(characterId = 4) {
    return new Promise((resolve, reject) => {
        dbObj.charactersMdl.findAll({
            where: {
                id: characterId
            },
            include: [
                {
                    model: dbObj.racesMdl,
                    as: 'raceObj',
                    required : true
                },
                {
                    model: dbObj.classesMdl,
                    as: 'classObj',
                    required : true

                },
                {
                    model: dbObj.realmsMdl,
                    as: 'realmObj',
                    required : true
                },
                {
                    model: dbObj.armoryMdl,
                    as: 'armoryList',
                    include: [                {
                        model: dbObj.characterSlotsMdl,
                        as: 'slotObj',
                        required : true
                    },
                    {
                        model: dbObj.armoryRankMdl,
                        as: 'rankItemObj'
                    },
                    {
                        model: dbObj.transmogMdl,
                        as: 'transmogObj',
                        include : {
                            model: dbObj.itemsMdl,
                            as: 'tranmoggedObj'
                        }
                    },
                    {
                        model: dbObj.enchantedMdl,
                        as: 'enchantedObj',
                        include : {
                            model : dbObj.enchantsMdl,
                            as : 'enchantObj',
                            required: true
                        } 
                    },
                    {
                        model: dbObj.gemmedMdl,
                        as: 'gemmedObj',
                        include : {
                            model : dbObj.gemsMdl,
                            as : 'gemObj',
                            required: true
                        } 
                    },
                    {
                        model: dbObj.itemsMdl,
                        as: 'itemSlotObj',
                        required : true,
                        include : [{
                            model: dbObj.itemTitles,
                            as: 'titleObj',
                            include : {
                                model: dbObj.itemOrigins,
                                as: 'originObj'
                            }
                        }
                       ]
                    
                    }]
                }
            ]
        }).then(results => {
            resolve(results);
        }).catch(err => {
            console.log(err);
            reject({errMsg: err, data: []});
        });
    });
}


module.exports = {getArmory}