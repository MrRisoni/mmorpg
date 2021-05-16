const AuctionHouseDAO = require('../../daos/AuctionHouse/auction_house_dao.js');

function getListingsForItem(req, res) {
   console.log('params ' + req.params.itemId);

   AuctionHouseDAO.getListingsForItem(req.params.itemId).then(data => {
    res.send(data);
   }).catch(err => {
       console.log(err);
      res.sendStatus(404);
   })
}

module.exports = {getListingsForItem}
