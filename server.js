const express = require('express');

const store = [{
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

function getPosts() {
  return store;
}

function getPost(postId) {
  return store.find(p => p.id === postId);
}

const app = express();

app.use(express.static('./public'));

app.get('/api/posts', (req, res) => {
  res.json(getPosts());
});

app.get('/api/posts/:id', (req, res) => {
  const postId = parseInt(req.params.id);
  res.json(getPost(postId));
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
