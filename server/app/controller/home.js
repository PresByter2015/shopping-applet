'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    const { ctx } = this;
    // ctx.body = 'hi, egg';
    const userInfo = await ctx.service.user.find(11);
    ctx.body = userInfo;
  }
}

module.exports = HomeController;
