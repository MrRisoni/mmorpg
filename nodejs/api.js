const port = process.env.PORT || 3500;
const express = require('express');
const app = express();
const http = require('http').Server(app);
const bodyParser = require('body-parser');
const cors = require('cors');

app.use(bodyParser.json());
app.use(cors());

const auctionHouseRoutes = require("./routes/AuctionHouse/auction_house_routes");

app.use("/", auctionHouseRoutes);

http.listen(port, (req, res) => {
    console.log('Server listening on port number', port);
});

module.exports = {
    serverApp: app
};