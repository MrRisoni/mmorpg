const express = require('express')
let router = express.Router()

const character_controller = require('./../../controllers/Character/character_controller');

router.get('/api/character/spells', character_controller.getUnlearnedSpells);
router.get('/api/character/armory', character_controller.getArmory);
router.get('/api/character/reputations', character_controller.getReputations);

module.exports = router;
