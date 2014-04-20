mongoose = require 'mongoose'
route    = require 'koa-route'
thunkify = require 'thunkify'
parse    = require 'co-body'

Fruit = require '../models/fruit'

module.exports = (app) ->
  app.use route.get '/api/fruits', (req, res) -->
    fruits = yield Fruit.find().exec()
    @body = fruits

  app.use route.post '/api/fruits', (req, res) -->
    body = yield parse this

    fruit = new Fruit body
    fruit.save = thunkify(fruit.save)

    yield fruit.save()

    @status = 201
