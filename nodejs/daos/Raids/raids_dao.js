const dbObj = require('./../models');

function  getTierSets() {
    return new Promise((resolve, reject) => {

        dbObj.tierSetsMdl.findAll({
            include: [
                {
                    model: dbObj.tierSetPiecesMdl,
                    as: 'pieceObj',
                    required: true,
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


module.exports = {getTierSets}