PredictionNote.Views.PredictionsIndex = Backbone.View.extend({

  template: JST['predictions/index'],

  render: function () {
    var renderedContent = this.template({
      predictions: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  }

});
