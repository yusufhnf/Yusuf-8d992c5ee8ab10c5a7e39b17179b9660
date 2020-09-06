module.exports = function (expressLib) {
    var query = require("../controllers/controller");

    expressLib.route('/userstest').get(query.index);
    
    expressLib.route('/userstest/users').get(query.showAllUsers);

    expressLib.route('/userstest/users/login').post(query.loginUser);

    expressLib.route('/userstest/users/create').post(query.register);

    expressLib.route('/userstest/users/logout').post(query.logOutUser);
}