# For more information see: http://emberjs.com/guides/routing/

Ela.Router.map ()->
  @resource 'pages', ->
    @route 'new'
    @route 'edit', {path: ':page_id'}