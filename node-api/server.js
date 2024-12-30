const express = require('express');
const app = express();

const books = [
    {id: 1, title: 'Alice in Wonderladn', author: 'Lewis Carrol'},
    {id: 2, title: 'Around the Wrold is eighthy days', author: 'Jules Verne'},
    {id: 3, title: 'Utopia', author: 'Sir Thomas Moor'},
]

app.get('/api/books', (req, res) => {
    res.json(books)
})

const port = 3000;
app.listen(port, '0.0.0.0', () => {
    console.log(`Server is listening on port ${port} http://192.168.195.138:3000/api/books`);
})