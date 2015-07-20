expect = require('indeed').expect

describe 'opted', ->
  Given -> @options =
    a: true
    b: 'b'
    bool: true
    long: 'baz'
    'name=': 'Andrew'
    list: ['rope', 'jelly']
  Given -> @opted = require '../lib/opted'
  When -> @args = @opted(@options)
  Then -> expect(@args).to.deep.equal [
    '-a',
    '-b',
    'b',
    '--bool',
    '--long',
    'baz',
    '--name=Andrew',
    '--list',
    'rope',
    '--list',
    'jelly'
  ]
