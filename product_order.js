const conn = require('./conexion.js');
const Sequelize = require('sequelize');

const productOrder = conn.define("product_order",{
    id_product_order: {
        type: Sequelize.DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    id_order: Sequelize.DataTypes.INTEGER,
    id_product: Sequelize.DataTypes.INTEGER,
    quantity: Sequelize.DataTypes.INTEGER,
},{});

module.exports = productOrder;