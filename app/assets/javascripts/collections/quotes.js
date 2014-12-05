window.Predictions = Backbone.Collection.extend({
  model: Prediction,
  url: 'api/predictions',

  initialize: function(){
    this.on('remove', this.hideModel, this);
  },

  hideModel: function(model){
    model.trigger('hide');
  },

  focusOnPrediction: function(id) {
    var modelsToRemove = this.filter(function(prediction){
      return prediction.id != id;
    });

    this.remove(modelsToRemove);
  }
})
