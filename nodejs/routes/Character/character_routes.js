const express = require('express')
let router = express.Router()

const character_controller = require('./../../controllers/Character/character_controller');

router.get('/api/character/spells', character_controller.getUnlearnedSpells);

module.exports = router;
