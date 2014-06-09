GameIndexController = Ember.ObjectController.extend
  username: Ember.computed.alias('user.name')

  actions:
    vote: (value)->
      vote = @store.createRecord('vote', value: value, username: @user.get('name'))
      @get('model.votes').addObject vote
      vote.save()
      @get('model').save()
    resetVotes: ->
      votes = @get('model.votes')
      votes.toArray().forEach (vote)->
        vote.destroyRecord()
        votes.removeObject(vote)
      @get('model').save()


`export default GameIndexController;`
