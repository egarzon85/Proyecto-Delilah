const conn = require('./conexion.js');
const Sequelize = require('sequelize');

const users = conn.define("users",{
    id_user: {
        type: Sequelize.DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    username: Sequelize.DataTypes.STRING,
    name: Sequelize.DataTypes.TEXT,
    surname: Sequelize.DataTypes.TEXT,
    email: Sequelize.DataTypes.TEXT,
    phone_number: Sequelize.DataTypes.INTEGER,
    password: Sequelize.DataTypes.TEXT,
    is_admin: Sequelize.DataTypes.BOOLEAN
},{});

module.exports = users;

