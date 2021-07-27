const SpellsDAO = require('../../daos/Character/spells_dao.js');
const ArmoryDAO = require('../../daos/Character/armory_dao.js');

function getUnlearnedSpells(req, res) {
    SpellsDAO.getUnlearnedSpells(3).then(data => {
        res.send(data);
    }).catch(err => {
        console.log(err);
        res.sendStatus(404);
    })
}

function getArmory(req, res) {
    ArmoryDAO.getArmory(1).then(data => {
        res.send(data);
    }).catch(err => {
        console.log(err);
        res.sendStatus(404);
    })
}


module.exports = {getUnlearnedSpells,getArmory}
