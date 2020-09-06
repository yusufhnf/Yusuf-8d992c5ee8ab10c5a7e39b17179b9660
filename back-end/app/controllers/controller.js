var response = require('../models/res');
var connection = require('../config/db');
const { query } = require('../config/db');

exports.index = function (req, res) {
    response.ok("Successful REST API Connect", res);
}

//to generate DB model
exports.showAllUsers = function (req, res) {
    connection.query('SELECT * FROM user', function (error, result) {
        if (error) {
            console.log(error);
            res.json({
                success: false,
                message: "Show data failed"
            }).end();
        } else {
            response.ok(result, res);
        }
    });
};

exports.loginUser = function (req, res) {
    var post = {
        username: req.body.username,
        password: req.body.password,
        logintime: req.body.logintime,
        loginstate: req.body.loginstate
    }
    connection.query('SELECT * FROM user WHERE username = ? AND password = ?',
        [post.username, post.password],
        function (error, result) {
            if (error) {
                console.log(error);
            } else {
                response.ok(result, res);
                connection.query('UPDATE user SET login_time = ?, login_state = ? WHERE username = ?',
                    [post.logintime, post.loginstate, post.username],
                    function (error, result) {
                        if (error) {
                            console.log(error);
                        } else {
                            console.log("Berhasil Update");
                        }
                    });
            }
        });
};

exports.register = function (req, res) {
    var post = {
        username: req.body.username,
        password: req.body.password,
    }

    connection.query('SELECT username FROM user WHERE username = ?',
        [post.username],
        function (error, result) {
            if (error) {
                console.log(error);
            } else {
                if (result.length == 0) {
                    console.log("=== Register: NO DUPLICATE USERNAME")
                    connection.query('INSERT INTO user (username, password) VALUES (?,?)',
                        [post.username, post.password],
                        function (error, result) {
                            if (error) {
                                console.log(error);
                            } else {
                                response.ok("=== Register: Register Success", res);
                            }
                        })
                } else {
                    res.json({
                        success: false,
                        message: "Already User"
                    }).end();
                }
            }
        });
};

exports.logOutUser = function (req, res) {
    var post = {
        username: req.body.username,
        loginstate: 'false'
    }
    connection.query('UPDATE user SET login_state = ? WHERE username = ?',
        [post.loginstate, post.username],
        function (error, result) {
            if (error) {
                console.log(error);
            } else {
                response.ok("Logout Success", res);
            }
        });
};

