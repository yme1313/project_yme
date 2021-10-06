const http = require('http');
//한 번 값이 할당되면 변경 불가 , 상수
const hostname = '127.0.0.1';
const port = 1333;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
/* 위와 동일
server.listen(port, hostname, function(){
  console.log(`Server running at http://${hostname}:${port}/`);
})
*/