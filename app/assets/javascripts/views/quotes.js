PredictionNote.Views.Quotes = Backbone.View.extend({

  template: JST['quotes'],

  render: function () {
    var renderedContent = this.template({
      quotes: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  }
});
