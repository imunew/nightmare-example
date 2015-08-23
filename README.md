# nightmare-example
## Setup

### git clone
```bash
$ git clone git@github.com:imunew/nightmare-example.git
$ cd nightmare-example
```

### npm install
```bash
$ npm install
```

### Create config.coffee from config.coffee.dist
```bash
$ cp tests/config.coffee.dist tests/config.coffee
$ vi tests/config.coffee
```

###Edit login {username} and {password} for `rakuten.co.jp`.
```coffee
# tests/config.coffee
config.app = {
  "login": {
    "url": "https://www.rakuten.co.jp/myrakuten/login.html"
    "username" : "{username}",
    "password" : "{password}"
  },
```


## Run test

### npm run
```bash
npm run e2e-test:example
```

### result
```bash
> nightmare-example@1.0.0 e2e-test:example /path/to/app/nightmare-example
> mocha --compilers coffee:coffee-script/register tests/example.coffee



  login and logout at rakuten.co.jp
    login and logout
phantom stdout: ReferenceError: Can't find variable: formParts


phantom stdout:   https://www.rakuten.co.jp/myrakuten/login.html:69 in onsubmit
  :1 in anonymous
  :0 in dispatchEvent
  phantomjs://webpage.evaluate():5
  phantomjs://webpage.evaluate():6

      ✓ login and logout (61994ms)


  1 passing (1m)
```

※上記、結果出力のうち、下記の部分は、`rakuten.co.jp`上のjavascriptの問題でした。
```
phantom stdout: ReferenceError: Can't find variable: formParts


phantom stdout:   https://www.rakuten.co.jp/myrakuten/login.html:69 in onsubmit
  :1 in anonymous
  :0 in dispatchEvent
  phantomjs://webpage.evaluate():5
  phantomjs://webpage.evaluate():6
```
