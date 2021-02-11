const conn = require('./conexion.js');
const Sequelize = require('sequelize');

const products = conn.define("products",{
    id_product: {
        type: Sequelize.DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name: Sequelize.DataTypes.TEXT,
    price: Sequelize.DataTypes.INTEGER,
    img_url: Sequelize.DataTypes.TEXT,
},{});

module.exports = products;