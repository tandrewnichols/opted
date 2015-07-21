expect = require('indeed').expect

describe 'opted', ->
  Given -> @options =
    a: true
    b: 'b'
    on: true
    off: false
    long: 'baz'
    'name=': 'Andrew'
    list: ['rope', 'jelly']
  Given -> @opted = require '../lib/opted'

  context 'singleDash false', ->
    When -> @args = @opted(@options)
    Then -> expect(@args).to.deep.equal [
      '-a',
      '-b',
      'b',
      '--on',
      '--no-off',
      '--long',
      'baz',
      '--name=Andrew',
      '--list',
      'rope',
      '--list',
      'jelly'
    ]

  context 'singleDash true', ->
    When -> @args = @opted(@options, true)
    Then -> expect(@args).to.deep.equal [
      '-a',
      '-b',
      'b',
      '-on',
      '-no-off',
      '-long',
      'baz',
      '-name=Andrew',
      '-list',
      'rope',
      '-list',
      'jelly'
    ]
