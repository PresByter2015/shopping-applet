import { Service } from 'egg';

/**
 * User Service
 */
export default class User extends Service {

  /**
   * sayHi to you
   * @param name - your name
   */
  public async sayHi(name = 'User') {
    return `hi, I am ${name}`;
  }
}
