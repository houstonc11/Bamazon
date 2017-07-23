var inquirer = require("inquirer");
var mysql = require("mysql");

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "server",
    database: "bamazon"
});

connection.connect(function(err) {
    if (err) throw err;
    console.log("connected as id" + connection.threadId);
    start();
});

var start = function() {
    console.log("ITEMS AVAILABLE FOR SALE:");
    var query = connection.query(
        "SELECT * FROM products",
        function(err, res) {
            if (err) throw err;

            for (var i = 0; i < res.length; i++) {
                console.log("id: " + res[i].item_id + " -- " + res[i].product_name + " -- " + "$" + res[i].price);
            }

            inquirer.prompt([{
                name: "idSelect",
                message: "Select the id of the product you would like to purchase:"
            }, {
                name: "units",
                message: "How many would you like to buy?"
            }]).then(function(answerData) {
                var chosenItem;
                for (var j = 0; j < res.length; j++) {
                    if (res[j].item_id == answerData.idSelect) {
                        chosenItem = res[j];
                    }
                }

                if (chosenItem.stock_quantity < parseInt(answerData.units)) {
                    console.log("\nInsufficient " + chosenItem.product_name + "s" + " available. Please redo your order.\n");
                    start();
                } else {
                    var query = connection.query(
                        "UPDATE products SET ? WHERE ?", [{
                                stock_quantity: (chosenItem.stock_quantity - answerData.units)
                            },
                            {
                                item_id: chosenItem.item_id
                            }
                        ],
                        function(err) {
                            if (err) throw err;
                            var totalCost = (chosenItem.price * answerData.units);
                            console.log("\nThe total cost of your order is $" + totalCost + "." + " Thank you for your purchase!")
                        }
                    );
                }
            });
        });
}