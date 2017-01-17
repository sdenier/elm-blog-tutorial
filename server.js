const express = require('express');

function getPosts() {
  return [{
    id : 0,
    author : 'John Doe',
    title : 'First Title',
    body : 'First Body'
  }, {
    id : 1,
    author : 'Jane Doe',
    title : 'Second Title',
    body : 'Second Body'
  }];
}

const app = express();

app.use(express.static('./public'));

app.get('/api/posts', (req, res) => {
  res.json(getPosts());
});

app.get('/api/*', (req, res) => {
  res.status(404).send('Not found');
});

app.get('*', (req, res) => {
  res.sendFile(__dirname + '/public/index.html');
});

const server = app.listen(3000, () => {
  const host = server.address().address;
  const port = server.address().port;
  console.log('Blog server listening on http://%s:%s', host, port);
});
