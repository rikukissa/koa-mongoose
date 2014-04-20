mongoose = require 'mongoose'

fruitSchema = new mongoose.Schema
  name:
    type: String
    default: 'Banana'

  weight:
    type: Number
    required: true

module.exports = mongoose.model 'Fruit', fruitSchema
