const dbObj = require('./models');


function  getListingsForItem(itemId = 1) {
    return new Promise((resolve, reject) => {

        dbObj.auctionHouseListingMdl.findAll({
            where: {
                itemId: itemId
            },
            order: [
                ['startingBidTotal', 'ASC'],
            ],
            include: [
                {
                    model: dbObj.itemsMdl,
                    as: 'itemObj',
                    required: false
                },
                {
                    model: dbObj.charactersMdl,
                    as: 'sellerObj',
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