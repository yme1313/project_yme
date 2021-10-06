const express = require('express');
var app = express();
var port = 3000;

app.locals.pretty = true;
app.set('views', './views');
app.set('view engine', 'pug');
app.use(express.static('public'));
app.use(express.json());
app.use(express.urlencoded({ extended : true }));

app.get('/form', function(req,res){
	res.render('form');
})
app.get('/template',function(req, res){
	res.render('temp',{time:Date(), title:'Pug'});
})
app.get('/form_receiver',function(req, res){
	var title = req.query.title;
	var description = req.query.description;
	res.send(title + ',' + description);
})
app.post('/form_receiver',function(req, res){
	var title = req.body.title;
	var description = req.body.description;
	res.send(title + ',' + description);
})
app.get('/topic/:id', function(req,res){
	var topics =[
		'JavaScript is ...',
		'Nodejs is ...',
		'Express is ...'
	];
	var output = `
	<a href="/topic/0">JavaScript</a><br>
	<a href="/topic/1">Nodejs</a><br>
	<a href="/topic/2">Express</a><br><br>
	${topics[req.params.id]}
	`
	res.send(output);
})
app.get('/topic/:id/:mode', function(req,res){
	res.send(req.params.id+ ','+ req.params.mode);
});
app.get('/', function(req, res){
	res.send('Welcome to My World!');
});
app.get('/login', function(req,res){
	res.send('<h1>Login plz!</h1>');
});
app.get('/winter', function(req, res){
	res.send('Hello Router, <img src="/winter.gif">');
})
app.get('/dynamic', function(req,res){
	var lis ='';
	var time = Date();
	for(var i = 0 ; i < 7 ; i++){
		lis = lis + '<li>cording</li>';
	}
	var output = `<!DOCTYPE html>
	<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Document</title>
	</head>
	<body>
		Hello, Dynamic!
		<ul>
		${lis}
		</ul>
		${time}
	</body>
	</html>`;
	res.send(output);
})

app.listen(port, function(){
	console.log('Conneted 3000 port!');
});
