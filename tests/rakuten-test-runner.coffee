Nightmare = require 'nightmare'

class RakutenTestRunner extends Nightmare

  constructor: (@config) ->
    super()

  login: () ->
    @
    .viewport(800,600)
    .goto(@config.app.login.url)
    .wait()
    .type('input#userid', @config.app.login.username)
    .type('input#passwd', @config.app.login.password)
    .click('input.loginButton')
    .wait()


module.exports = RakutenTestRunner
