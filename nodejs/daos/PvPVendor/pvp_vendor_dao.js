const dbObj = require('./../models');

function  listCurrentSeasonHonorItems() {
    return new Promise((resolve, reject) => {
        let currentSeason  =1;

        dbObj.pvpVendorsMdl.findAll({
            where : {
                currencyId :1
            },
            include: [
                {
                    model: dbObj.pvpVendorItemsMdl,
                    as: 'itemsList',
                    where: {
                        season:currentSeason
                    },
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

module.exports = {listCurrentSeasonHonorItems}