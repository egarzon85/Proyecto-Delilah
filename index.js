//SERVER
const express = require('express');
const server = express();
server.use(express.json());

server.listen(3000, function () {
    console.log('El servidor express corre en el puerto 3000');
});

//SEGURIDAD HELMET
const helmet = require('helmet');
server.use(helmet());
server.disable('x-powered-by');

//IMPORT MODELS
const users = require('./users');
const products = require('./products');


//SIGNATURE JWT
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
const signature = "Lymd24%EM~FHb*4Q%Bd8"
const bodyParser = require("body-parser");
server.use(bodyParser.json());



//////////////////////////USERS///////////////////////////


// CREAR UN NUEVO USUARIO

server.post("/users", validateUsername, validateEmail, function (req, res) {
    bcryptjs.genSalt(10, function(err,salt){
        bcryptjs.hash(req.body.password, salt, function(err,hash){
            users.create({
                username: req.body.username,
                name: req.body.name,
                surname: req.body.surname,
                email: req.body.email,
                phone_number: req.body.phone_number,
                password: hash,
                is_admin: req.body.is_admin
            }).then(function (users) {
                res.status(201).json({
                    "id": users.id_user,
                    "msg": "User created successfully"
                })
            });
        }) 
        });
    });
    

// LISTAR TODAS LOS USUARIOS

server.get("/users", auth, function (req, res) {
    users.findAll({
        raw: true,
    }).then(function (users) {
        res.status(200).json(users);
    });
})


// LISTAR UN USUARIO

server.get("/users/:id_user", auth, function (req, res) {
    let {
        id_user
    } = req.params;
    users.findAll({
        where: {
            id_user: id_user
        }
    }).then(function (users) {
        if (users[0]) {
            res.status(200).json(users[0]);
        } else {
            res.status(404).json("No user found")
        }
    });
});

//////////////////////////PRODUCTS///////////////////////////

//CREAR UN NUEVO PRODUCTO

server.post("/products", auth, validateProduct,function (req, res) {
    products.create({
        name: req.body.name,
        price: req.body.price,
        img_url: req.body.img_url
    }).then(function (products) {
        res.status(201).json({
            "id": products.id_product,
            "msg": "Product created successfully"
        })
    });
}) 

// LISTAR TODAS LOS PRODUCTOS

server.get("/products", auth, function (req, res) {
    products.findAll({
        raw: true,
    }).then(function (products) {
        res.status(200).json(products);
    });
})


// LISTAR UN PRODUCTO

server.get("/products/:id_product", auth, function (req, res) {
    let {
        id_product
    } = req.params;
    products.findAll({
        where: {
            id_product: id_product
        }
    }).then(function (products) {
        if (products[0]) {
            res.status(200).json(products[0]);
        } else {
            res.status(404).json("No product found")
        }
    });
});


//ELIMINAR UN PRODUCTO

server.delete("/products/:id_product", auth, function (req, res) {
    let {
        id_product
    } = req.params;
    products.destroy({
        where: {
            id_product: id_product
        }
    }).then(function (borrado) {
        if (borrado === 0) {
            res.status(404).json("No product found")
        } else {
            res.status(201).json({
                //"id": borrado.id_product,
                "msg": "Product deleted successfully"
            })
        }
    });
});


//////////////////////////LOGIN///////////////////////////

server.post("/users/login", function (req, res) {
    users.findOne({where:{username: req.body.username}}).then(user => {
        if(user === null){
            res.status(401).json({
                message: "Invalid credentials!",
            });
        }else{
            bcryptjs.compare(req.body.password, user.password, function(err, result){
                if(result){
                    const token = jwt.sign({
                        id_user: user.id_user,
                        username: user.username,
                        is_admin: user.is_admin
                    }, signature, function(err, token){
                        res.status(200).json({
                            message: "Authentication successful!",
                            token: token
                        });
                        //req.userData = userData
                    });
                }else{
                    res.status(401).json({
                        message: "Invalid credentials!",
                    });
                }
            });
        }
    }).catch(error => {
        res.status(500).json({
            message: "Something went wrong!",
        });
    });
});

//////////////////////////VALIDACIONES///////////////////////////

function validateUsername(req, res, next) {
    users.findAll({
        where: {
            username: req.body.username
        }
    }).then(function (users) {
        if (users[0]) {
            res.status(401).json("Username already in use")
        } else {
            return next();
        }
    });
}

function validateEmail(req, res, next) {
    users.findAll({
        where: {
            email: req.body.email
        }
    }).then(function (users) {
        if (users[0]) {
            res.status(401).json("Email already in use")
        } else {
            return next();
        }
    });
}

function validateProduct(req, res, next) {
    products.findAll({
        where: {
            name: req.body.name
        }
    }).then(function (products) {
        if (products[0]) {
            res.status(401).json("Product already created")
        } else {
            return next();
        }
    });
}

function auth(req, res, next) {
try {
    const token = req.headers.authorization.split(" ")[1];
    const validData = jwt.verify(token, signature);
    console.log(validData);
    if (validData) {
    req.userData = validData.userData;
    next();
    }
} catch (err) {
    res.status(401).json("You must provide a valid token");
}
}
