const CharCreationDAO = require('../../daos/CharCreation/char_creation_dao.js');

function getAllRacesClassesCombos(req, res) {
    CharCreationDAO.getRaceClassCombo().then(data => {
        res.send(data);
    }).catch(err => {
        console.log(err);
        res.sendStatus(404);
    })
}

module.exports = {getAllRacesClassesCombos}
