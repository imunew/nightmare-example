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

### Create config.js from config.js.dist
```bash
$ cp test/config.js.dist test/config.js
$ vi test/config.js
```

###Edit login {username} and {password} for `rakuten.co.jp`.
```javascript
# test/config.js
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
> mocha --harmony test/example.js



  login and logout at rakuten.co.jp
    login and logout
      ✓ login (3830ms)
      ✓ logout (3809ms)


  2 passing (8s)
```
