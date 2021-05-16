const dbObj = require('./../models');

function  getRaceClassCombo() {
    return new Promise((resolve, reject) => {
        dbObj.racesClassesMdl.findAll({
            include: [
                {
                    model: dbObj.racesMdl,
                    as: 'raceObj'
                },
                {
                    model: dbObj.classesMdl,
                    as: 'classObj'
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

module.exports = {getRaceClassCombo}