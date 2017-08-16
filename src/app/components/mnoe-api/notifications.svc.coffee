# Service for managing the users.
angular.module 'mnoEnterpriseAngular'
  .service 'MnoeNotifications', (MnoeFullApiSvc, MnoeOrganizations) ->

    @get = (params = {})->
      MnoeOrganizations.get().then(->
        MnoeFullApiSvc
          .one('organizations', MnoeOrganizations.getSelectedId())
          .getList('notifications', params)
      )

    @notified = (params)->
      MnoeOrganizations.get().then(->
        MnoeFullApiSvc
          .one('organizations', MnoeOrganizations.getSelectedId())
          .one('notifications')
          .post('/notified', params)
      )

    return @