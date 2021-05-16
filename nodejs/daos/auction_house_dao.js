const dbObj = require('./models');


function  getListingsForItem(itemId = 1) {
    return new Promise((resolve, reject) => {

        dbObj.auctionHouseListingMdl.findAll({
            where: {
                itemId: itemId,
                delisted :0,
                sold:0
            },
            order: [
                ['buyoutTotal', 'ASC'],
            ],
            include: [
                {
                    model: dbObj.itemsMdl,
                    as: 'itemObj'
                },
                {
                    model: dbObj.charactersMdl,
                    as: 'sellerObj'
                },
                {
                    model: dbObj.auctionHouseBiddingMdl,
                    as: 'bidsListObj',
                    required: false
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


module.exports = {getListingsForItem}