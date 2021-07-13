const PvpVendorDAO = require('../../daos/PvPVendor/pvp_vendor_dao.js');

function listCurrentSeasonHonorItems(req, res) {
    PvpVendorDAO.listCurrentSeasonHonorItems().then(data => {
        res.send(data);
    }).catch(err => {
        console.log(err);
        res.sendStatus(404);
    })
}

module.exports = {listCurrentSeasonHonorItems}
