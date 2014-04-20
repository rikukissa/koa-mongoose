koa      = require 'koa'
route    = require 'koa-route'
serve    = require 'koa-static'
mongoose = require 'mongoose'

DATABASE = 'mongodb://localhost/my-app'

mongoose.connect DATABASE

app = koa()

app.use serve __dirname + '/public'

# Error handling
app.use (next) -->
  try
    yield next
  catch err
    @app.emit 'error', err, this

    if err.name is 'ValidationError'
      return @status = 400

    @status = err.status or 500

app.on 'error', (err) ->
  console.error err

# Controllers
require('./controllers/fruit') app

app.listen 9001
