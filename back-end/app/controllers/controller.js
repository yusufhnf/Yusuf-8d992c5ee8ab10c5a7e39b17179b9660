var response = require('../models/res');
var connection = require('../config/db');

exports.index = function (req, res) {
    response.ok("Successful REST API Connect", res);
}

exports.showAllUsers = function (req, res) {
    connection.query('SELECT * FROM user', function (error, result) {
        if (error) throw error;
        response.ok(result, res);
    });
};

exports.loginUser = function (req, res) {
    let username = req.params.username;
    let password = req.params.password;
    connection.query('SELECT * FROM user WHERE username = ? AND password = ?',
        [username, password],
        function (error, result) {
            if (error) throw error;
            response.ok(result, res);
        });
};

exports.createUser = function (req, res) {
    var username = req.body.username;
    var password = req.body.password;
    var timestamp = req.body.timestamp;
    var loginstate = req.body.loginstate

    connection.query('INSERT INTO users (username, password, login_time, login_state) VALUES (?,?,?,?)',
        [username, password, timestamp, loginstate],
        function (error, result) {
            if (error) throw error;
            response.ok("Berhasil Tambah Data", res);
        });
};

exports.logOutUser = function (req, res) {
    let username = req.params.username;
    connection.query('UPDATE user SET login_state = ? WHERE username = ?',
        ['false', username],
        function (error, result) {
            if (error) throw error;
            response.ok("Keluar", res);
        });
};

