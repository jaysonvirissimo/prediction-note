PredictionNote.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  index: function () {
    PredictionNote.Collections.predictions.fetch();

    var indexView = new PredictionNote.Views.PredictionsIndex({
      collection: PredictionNote.Collections.predictions
    });

    this._swapView(indexView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currenView = view;
    this.$rootEl.html(view.render().$el);
  }
});
