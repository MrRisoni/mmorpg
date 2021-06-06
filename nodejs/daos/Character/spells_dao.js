/*SELECT sp.id,specs.title, sp.title, sp.rank_id FROM spells sp
JOIN class_specs specs ON sp.spec_id = specs.id
LEFT JOIN learned_spells lsp ON lsp.spell_id = sp.id AND lsp.character_id = 3
WHERE lsp.spell_id IS NULL
ORDER BY sp.required_lvl */

const models = require('./../models');
const _ = require('lodash');
const { QueryTypes } = require('sequelize');

function getUnlearnedSpells(characterId) {
   // return new Promise((resolve, reject) => {
        let q = " SELECT sp.id AS spellId,specs.id AS specId,specs.title AS specTitle, sp.title, sp.rank_id,sp.cost_total FROM spells sp " +
            "JOIN class_specs specs ON sp.spec_id = specs.id " +
            "LEFT JOIN learned_spells lsp ON lsp.spell_id = sp.id AND lsp.character_id = '"+ characterId +"' " +
            "WHERE lsp.spell_id IS NULL " +
            "ORDER BY sp.required_lvl  ";

        models.dbObj.query(q, {
            nest: true,
            type: QueryTypes.SELECT
        }).then(data => {
            let spellCats  = _.uniq(data.map(sp => {
                return sp.specTitle;
            }));

            let spellData = [];
            spellCats.forEach(spCat => {
                let tmp = {spec: spCat, spells:[]};
                data.forEach(dt => {
                    if (dt.specTitle == spCat )   {
                        tmp.spells.push(dt.title)
                    }
                });
                spellData.push(tmp);
            });

            console.log(spellData);
        });

   /* }).then(results => {
        resolve(results);
    }).catch(err => {
        console.log(err);
        reject({errMsg: err, data: []});
    });
*/
}

module.exports = {getUnlearnedSpells}