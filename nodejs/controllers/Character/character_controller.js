const SpellsDAO = require('../../daos/Character/spells_dao.js');

function getUnlearnedSpells(req, res) {
    SpellsDAO.getUnlearnedSpells(3).then(data => {
        res.send(data);
    }).catch(err => {
        console.log(err);
        res.sendStatus(404);
    })
}

module.exports = {getUnlearnedSpells}
