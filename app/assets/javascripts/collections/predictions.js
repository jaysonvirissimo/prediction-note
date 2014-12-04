PredictionNote.Collections.Predictions = Backbone.Collection.extend({
  model: PredictionNote.Models.Prediction,
  url: 'api/predictions',

  getOrFetch: function (id) {
    var prediction = this.get(id);

    if(!prediction) {
      prediction = new PredictionNote.Models.Prediction({ id: id });
      prediction.fetch({
        success: function () {
          this.add(prediction);
        }.bind(this)
      });
    } else {
      prediction.fetch();
    }

    return prediction;
  }
});

PredictionNote.Collections.predictions = new PredictionNote.Collections.Predictions
