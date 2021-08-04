const express = require('express')
let router = express.Router()

const tier_set_controller = require('./../../controllers/Raids/tier_set_controller');

router.get('/api/tier_sets', tier_set_controller.getTierSets);

module.exports = router;
