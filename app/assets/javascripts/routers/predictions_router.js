PredictionNote.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "home",
    "predictions": "index"
  },

  home: function () {
    PredictionNote.Collections.quotes.fetch();
    debugger;
    var homeView = new PredictionNote.Views.Home({
      quotes: PredictionNote.Collections.quotes
    });
    this._swapView(homeView);
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
