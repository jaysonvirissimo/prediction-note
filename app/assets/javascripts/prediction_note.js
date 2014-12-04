window.PredictionNote = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new PredictionNote.Routers.Router({
      $rootEl: $("#content")
    });
    Backbone.history.start();
  }
};
