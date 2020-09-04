module.exports = function (expressLib) {
    var query = require("../controllers/controller");

    expressLib.route('/userstest').get(query.index);

    expressLib.route('/userstest/users/login/:username').get(query.loginUser);

    expressLib.route('/userstest/users/create').post(query.createUser);

    expressLib.route('userstest/users/logout/:username').post(query.logOutUser);
}