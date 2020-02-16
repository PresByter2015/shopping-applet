import { Controller } from 'egg';

export default class HomeController extends Controller {
  public async index() {
    const { ctx } = this;
    ctx.body = '9999';
    // ctx.body = await ctx.service.test.sayHi('egg111111');
  }
  /*
  public async user() {
    const { ctx } = this;
    ctx.body = 'await ctx.service.user.sayHi()';
    // ctx.body = await ctx.service.user.sayHi('egg111111');
  }
  */
}
