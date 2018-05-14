
var express = require("express");
var mysql = require("mysql");
var bodyParser = require('body-parser');
var app = express();
var arr = [];
var idTheme;
app.use("/images",express.static(__dirname + "/images"));
app.use("/css", express.static(__dirname + "/css"));
app.use("/js", express.static(__dirname + "/js"));
app.use("/music", express.static(__dirname + "/music"));
app.use("/fonts", express.static(__dirname + "/fonts"));
app.set('views',__dirname + '/');
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);
var connection = mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "1",
	database: "mydb"
});
var urlCodeParser = bodyParser.urlencoded({extended: false});


app.get("/", function(req, res){
	connection.query("SELECT * FROM themes", function(error, rows, fields){
		res.render("1",{cards: rows});
	});

});

app.get("/learn", function(req, res){
	idTheme = req.param("id");
	var sel = "SELECT * FROM words WHERE idTheme = " + idTheme;
	connection.query(sel, function(error, rows, fields){

		res.render("2",{front: rows[0].word, back: rows[0].mean});
	});
});

app.get("/test", function(req, res){
	res.render("3");
});
app.get("/chucmung", function(req, res){
	res.render("4");
});
app.post('/clicked', (req, res) => {
	console.log("dabam");
});
app.get('/clicks', (req, res) => {
  	connection.query("SELECT * FROM words WHERE idTheme = " + idTheme, function(error, rows, fields){
		res.send(rows);
		return;
	});
});
app.listen(3000);