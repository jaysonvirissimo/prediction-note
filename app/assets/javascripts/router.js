window.PredictionNote = new (Backbone.Router.extend({
  routes: {
    "": "index",
    "predictions/:id": "show"
  },

  initialize: function(){
    this.predictions = new Predictions();
    this.predictionsView = new PredictionsView({collection: this.predictions});
    this.predictionsView.render();
  },

  index: function(){
    //$('#backbone-test').html(this.predictionsView.el);
    //this.predictions.fetch();
    // turn off index for now
  },

  start: function(){
    Backbone.history.start();
  },

  show: function(id){
    this.predictions.focusOnPrediction(id);
  }
}));
