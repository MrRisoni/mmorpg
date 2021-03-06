const SpellsDAO = require('../../daos/Character/spells_dao.js');
const ArmoryDAO = require('../../daos/Character/armory_dao.js');
const ReputationDAO = require('../../daos/Character/reputation_dao.js');

function getUnlearnedSpells(req, res) {
    SpellsDAO.getUnlearnedSpells(3).then(data => {
        res.send(data);
    }).catch(err => {
        console.log(err);
        res.sendStatus(404);
    })
}

function getArmory(req, res) {
    ArmoryDAO.getArmory(4).then(data => {
        res.send(data);
    }).catch(err => {
        console.log(err);
        res.sendStatus(404);
    })
}

function getReputations(req, res) {
    ReputationDAO.getReputations(4).then(data => {
        res.send(data);
    }).catch(err => {
        console.log(err);
        res.sendStatus(404);
    })
}




module.exports = {getUnlearnedSpells,getArmory,getReputations}
