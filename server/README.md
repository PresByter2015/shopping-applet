# shopping-applet-server

a shopping project

## QuickStart

<!-- add docs here for user -->

see [egg docs][egg] for more detail.

### Development

```bash
$ npm i
$ npm run dev
$ open http://localhost:7001/
```

### Deploy

```bash
$ npm start
$ npm stop
```

### npm scripts

- Use `npm run lint` to check code style.
- Use `npm test` to run unit test.
- Use `npm run autod` to auto detect dependencies upgrade, see [autod](https://www.npmjs.com/package/autod) for more detail.


[egg]: https://eggjs.org

### 链接mysql

> npm i --save egg-mysql

- [egg-mysql](https://eggjs.org/zh-cn/tutorials/mysql.html)
### 业务层
![image.png](https://i.loli.net/2020/01/19/fotTlFG1bvO8ZmB.png)
app/service/** 用于编写业务逻辑层，可选，建议使用
- [service](https://eggjs.org/zh-cn/basics/service.html)

### 中间件 --- 鉴权
- [middleware](https://eggjs.org/zh-cn/basics/middleware.html)
#### 全局鉴权
1. 在 `app/middleware/` 下，建一个`log.js`文件
2. 声明如下方式
```js
'use strict';
module.exports = options => {
  return async function log(ctx, next) {
    await next();
    const body = ctx.body;
    if (!body) return;
    console.log('66666666666666666666', JSON.stringify(body));
  };
};
```
3. 使用中间件 在`config/config.default.js` 写入如下配置
```js
  // add your middleware config here
  config.middleware = [ 'log' ];
```
#### 局部路由 中间件
1. 在使用的时候 在`config/config.default.js` 写入如下配置
```js
// add your middleware config here
  config.middleware = [ 'log' ];
  config.log = {
    match: '/static',
  };
//   只针对 /static 前缀开头的 url 请求 有效
```
**只针对 /static 前缀开头的 url 请求 有效**
2. 在某一个路由下 使用
- [中间件的使用](https://eggjs.org/zh-cn/basics/router.html#%E4%B8%AD%E9%97%B4%E4%BB%B6%E7%9A%84%E4%BD%BF%E7%94%A8)
```js
// app/controller/search.js
exports.index = async ctx => {
  ctx.body = `search: ${ctx.query.name}`;
};

// app/middleware/uppercase.js
module.exports = () => {
  return async function uppercase(ctx, next) {
    ctx.query.name = ctx.query.name && ctx.query.name.toUpperCase();
    await next();
  };
};

// app/router.js
module.exports = app => {
  app.router.get('s', '/search', app.middleware.uppercase(), app.controller.search)
};
```