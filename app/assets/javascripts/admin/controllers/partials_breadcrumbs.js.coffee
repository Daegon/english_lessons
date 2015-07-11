Ela.PartialsBreadcrumbsController = Ember.Controller.extend
  needs: [ 'application' ]
  header: (->
    previousRoutes = @container.lookup('router:main').get('router.currentHandlerInfos').mapBy 'handler'
    previousRoute = previousRoutes && previousRoutes.pop()
    if typeof previousRoute.controller.header is 'function'
      previousRoute.controller.header()
    else
      previousRoute.controller.header
  ).property('controllers.application.currentPath')
  breadcrumbs: (->
    currentHandlerInfos = @container.lookup('router:main').get('router.currentHandlerInfos').mapBy 'handler'
    routes = []
    currentHandlerInfos.forEach (item)->
      if item.controller.breadcrumb?
        routes.push name: item.controller.breadcrumb(), path: item.routeName
    routes
  ).property('controllers.application.currentPath')