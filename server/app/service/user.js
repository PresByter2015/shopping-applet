'use strict';
const Service = require('egg').Service;

class UserService extends Service {
  async find(uid) {
    console.log(this.app.mysql);

    // const user = await this.ctx.db.query('select * from user where uid = ?', uid);
    const user = await this.app.mysql.query('select * from user where uid = ?', uid);
    return user;
  }
}

module.exports = UserService;
