'use strict';
/**
*～╭════╮┌══════════════┐
* ╭╯开车║ ▁▂▃▅▆▇  |  ~~~
* ╰⊙═⊙╯╰══⊙══════⊙══╯
* @description:  用户页面
* @author: PresByter
* @date  : 2020/01/20 09:48:04
* @file  : user.js
*/

const Service = require('egg').Service;

class UserService extends Service {
  async find(uid) {
    console.log(this.app.mysql);

    // const user = await this.app.mysql.query('select * from user where uid = ?', uid);
    // const user = await this.app.mysql.get('user');//获取第一个
    const user = await this.app.mysql.select('user'); // 获取所有数据
    return user;
  }
}

module.exports = UserService;
