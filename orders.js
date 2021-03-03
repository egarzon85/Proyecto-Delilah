const conn = require('./conexion.js');
const Sequelize = require('sequelize');

const orders = conn.define("orders",{
    id_order: {
        type: Sequelize.DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    id_user: Sequelize.DataTypes.INTEGER,
    id_status: Sequelize.DataTypes.INTEGER,
    id_pay_method: Sequelize.DataTypes.INTEGER,
    total: Sequelize.DataTypes.DECIMAL,
},{});

module.exports = orders;