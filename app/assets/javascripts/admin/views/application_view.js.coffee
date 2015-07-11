# for more details see: http://emberjs.com/guides/views/

Ela.ApplicationView = Ember.View.extend
  didInsertElement: ->
    initAdminPanelTemplate()