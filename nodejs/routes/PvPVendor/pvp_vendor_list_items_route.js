const express = require('express')
let router = express.Router()

const pvp_vendor_controller = require('./../../controllers/PvPVendor/pvp_vendor_controller');

router.get('/api/pvp/current_season/honor', pvp_vendor_controller.listCurrentSeasonHonorItems);

module.exports = router;
