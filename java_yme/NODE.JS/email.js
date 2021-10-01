const { info } = require('console');
const nodemailer = require('nodemailer');
const email = {
  host: "smtp.mailtrap.io",
  port: 2525,
  auth: {
    user: "49f7f8640d135e",
    pass: "68772af9088ea1"
  }
};

const send = async (data) => {
	nodemailer.createTransport(email).sendMail(data, function(error, info) {
		if(error){
			console.log(error);
		} else {
			console.log(info);
			return info.response;
		}
	});
};

const content = {
	from : 'yme131313@gmail.com',
	to : '5612f57ca2-308745@inbox.mailtrap.io',
	subject : 'test',
	// text : 'nodeemailer 테스트'
	html : "<h2>nodejs 연습</h2>"
};

send(content);