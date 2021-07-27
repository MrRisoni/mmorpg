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
                        model: dbObj.itemsMdl,
                        as: 'itemSlotObj',
                        required : true
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