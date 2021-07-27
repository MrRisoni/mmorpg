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
                    as: 'raceObj'
                },
                {
                    model: dbObj.classesMdl,
                    as: 'classObj'
                },
                {
                    model: dbObj.realmsMdl,
                    as: 'realmObj'
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