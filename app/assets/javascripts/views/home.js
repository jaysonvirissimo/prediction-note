PredictionNote.Views.Home = Backbone.View.extend({

  template: JST['home'],

  render: function () {
    var renderedContent = this.template({
      quotes: this.quotes
    });
    this.$el.html(renderedContent);
    return this;
  }

});
