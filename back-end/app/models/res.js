exports.ok = function(values, res) {
    // var data = {
    //     'status': 200,
    //     'values': values
    // };

    var data = values;

    console.log(values);
    res.json(data);
    res.end();
}