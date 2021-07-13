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
                    required: true,
                    include: [
                        {
                            model: dbObj.itemsMdl,
                            as: 'itemPvpObj',
                            required: true,
                            include: [
                                {
                                    model: dbObj.itemStatsMdl,
                                    as: 'itemStatsObj',
                                    required: true,
                                    
        
                                }
                            ]

                        }
                    ]
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