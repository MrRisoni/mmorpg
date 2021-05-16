const express = require('express')
let router = express.Router()

const char_creation_controller = require('./../../controllers/CharCreation/char_creation_controller');

router.get('/api/char_creation/classes', char_creation_controller.getAllRacesClassesCombos);

module.exports = router;
