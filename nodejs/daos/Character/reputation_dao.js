const dbObj = require('./../models');


function  getReputations(characterId = 4) {
    return new Promise((resolve, reject) => {
        dbObj.reputationCharacterMdl.findAll({
            include: [
                {
                    model: dbObj.charactersMdl,
                    as: 'charObj',
                    required : true,
                    where : {
                        id : characterId
                    }
                },
                {
                    model: dbObj.reputationFactionsMdl,
                    as: 'factionObj',
                    required : true
                },
                {
                    model: dbObj.reputationRanksMdl,
                    as: 'factionRankObj',
                    required : true
                },
            ]           
        }).then(results => {
            resolve(results);
        }).catch(err => {
            console.log(err);
            reject({errMsg: err, data: []});
        });
    });
}


module.exports = {getReputations}