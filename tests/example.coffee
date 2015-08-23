assert = require 'assert'
RakutenTestRunner = require './rakuten-test-runner'
config = require './config'

testRunner = new RakutenTestRunner(config)

describe 'login and logout at rakuten.co.jp', () ->

  this.timeout(config.mocha.timeout)

  # 楽天にログイン、ログアウト
  describe 'login and logout', () ->

    it 'login and logout', (done) ->
      testRunner
      .login()
      .evaluate(
        () ->
          return {
              "location": location.origin + location.pathname
          }
      ,
        (result) ->
          assert.equal(result.location, 'http://www.rakuten.co.jp/')
      )
      .screenshot('./logs/screenshots/login.png')
      .click('a.mr-logout-btn')
      .wait()
      .evaluate(
        () ->
          return {
            "location": location.origin + location.pathname
          }
      ,
        (result) ->
          assert.equal(result.location, config.app.logout.url)
      )
      .screenshot('./logs/screenshots/logout.png')
      .run(done)
