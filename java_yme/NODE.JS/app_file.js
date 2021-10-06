const express = require('express');
var app = express();
var fs = require('fs');
var port = 1234;

app.locals.pretty = true;
app.set('views', './views_file');
app.set('view engine', 'pug');
app.use(express.json());
app.use(express.urlencoded({ extended : true }));

app.get('/topic/new', function(req, res){
	fs.readdir('data', function(err, files){
		if(err){
			console.log(err)
			res.status(500).send('Internal Server Error');
		}
		res.render('new',{topics :files});
	});	
});
app.get(['/topic', '/topic/:id'], function(req,res){
	var id = req.params.id;
	fs.readdir('data', function(err, files){
		if(err){
			console.log(err)
			res.status(500).send('Internal Server Error');
		}
		var id = req.params.id;
		if(id){
			// id 값이 있을 때
			fs.readFile('data/'+id, 'utf-8', function(err, data){
				if(err){
					console.log(err)
					res.status(500).send('Internal Server Error');
				}
				res.render('view',{title:id , topics:files, content:data});
			})
		} 
		else {
					// id 값이 없을 때
		res.render('view', {topics:files, title:'Welcome', content : 'Hello, JavaScript for server.'});
		}
	})
})

app.post('/topic',function(req,res){
	var title = req.body.title;
	var description = req.body.description;
	fs.writeFile('data/'+title, description , function(err){
		if(err){
			console.log(err)
			res.status(500).send('Internal Server Error');
		}
	})
	res.redirect('/topic/' + title);
})

app.listen(port, function(){
	console.log('Connected, 1234!');
});