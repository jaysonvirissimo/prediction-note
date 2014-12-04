PredictionNote.Collections.Predictions = Backbone.Collection.extend({
  url: "api/predictions",

  model: PredictionNote.Models.Prediction,

  getOrFetch: function (id) {
    var prediction = this.get(id);
    var predictions = this;

    if(!prediction) {
      prediction = new PredictionNote.Models.Prediction({ id: id });
      prediction.fetch({
        success: function () {
          predictions.add(prediction);
        }.bind(this)
      });
    } else {
      prediction.fetch();
    }

    return prediction;
  }

});

PredictionNote.Collections.predictions = new PredictionNote.Collections.Predictions();
