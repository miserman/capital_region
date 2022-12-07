'use strict'
const DataHandler = require('../data_handler.v1.min.js'),
  data = new DataHandler(require('../settings.json'), void 0, {
    block_group: require('../block_group.json'),
    tract: require('../tract.json'),
    neighborhood: require('../neighborhood.json'),
    county: require('../county.json'),
    zip_code: require('../zip_code.json'),
    planning_district: require('../planning_district.json'),
    supervisor_district: require('../supervisor_district.json'),
    human_services_region: require('../human_services_region.json'),
  })
module.exports.handler = async function (event) {
  return data.export(event.queryStringParameters)
}
