'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller, middleware } = app;
  router.get('/a', controller.home.index);
  router.get('/static', middleware.checkTokenIsLogin(), controller.home.index);
};
