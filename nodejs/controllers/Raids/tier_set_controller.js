const TierSetDAO = require('../../daos/Raids/raids_dao.js');

function getTierSets(req, res) {

   TierSetDAO.getTierSets().then(data => {
    res.send(data);
   }).catch(err => {
       console.log(err);
      res.sendStatus(404);
   })
}

module.exports = {getListingsForItem}
