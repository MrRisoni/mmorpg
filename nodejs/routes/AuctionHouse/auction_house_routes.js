const express = require('express')
let router = express.Router()

const auction_house_controller = require('./../../controllers/AuctionHouse/auction_house_controller');

router.get('/api/ah/get_listings/:itemId', auction_house_controller.getListingsForItem);

module.exports = router;
