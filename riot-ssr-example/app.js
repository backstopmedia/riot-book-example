const express = require('express')
const app = express()
const path = require('path')
const riot = require('riot')
const helloWorld = require('./components/hello-world.tag')

app.use(express.static(path.join(__dirname, './public')))

app.set('view engine', 'ejs')
app.set('views', path.join(__dirname, './views/'))

app.get('/', (req, res) => {
  const user = { name: 'Joseph' }
  res.render('index', 
    { 
      title: 'Riot SSR Example', 
      body: riot.render(helloWorld, user),
      user: user
    }) 
})

app.listen(3000, () => {
  console.log('Server listening on port 3000')
})