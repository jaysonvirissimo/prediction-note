window.PredictionNote = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Utils: {},
  initialize: function() {
    // new PredictionNote.Routers.Router
    // Backbone.history.start();
  }
};

$(document).ready(function () {
  $('#tutorial-button').on('click', function () {
    alert("it's working!");
  })
});
