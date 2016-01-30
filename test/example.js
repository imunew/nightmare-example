require('mocha-generators').install();

var Nightmare = require('nightmare');
var config = require('./config');
var should = require('chai').should();

describe ('login and logout at rakuten.co.jp', function() {

    /** 楽天にログイン、ログアウト */
    describe ('login and logout', function () {

        var nightmare;

        beforeEach (function() {
            nightmare = Nightmare();
        });

        afterEach (function*() {
            yield nightmare.end();
        });

        it ('login', function*() {

            var location = yield nightmare
                .viewport(1024,768)
                .goto(config.app.login.url)
                .wait()
                .type('input#userid', config.app.login.username)
                .type('input#passwd', config.app.login.password)
                .click('input.loginButton')
                .wait(100)
                .screenshot('./logs/screenshots/login.png')
                .wait(100)
                .evaluate(function () {
                    return location.origin + location.pathname;
                })
                ;

            location.should.eql('http://www.rakuten.co.jp/');
        });

        it ('logout', function*() {

            var location = yield nightmare
                .goto('http://www.rakuten.co.jp/')
                .wait()
                .click('a.mr-logout-btn')
                .wait(100)
                .screenshot('./logs/screenshots/logout.png')
                .wait(100)
                .evaluate(function() {
                    return location.origin + location.pathname;
                })
                ;

            location.should.eql(config.app.logout.url);
        });

    });

});
