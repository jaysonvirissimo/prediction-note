PredictionNote.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "predictions"
  },

  quotes: function () {
    PredictionNote.Collections.quotes.fetch();

    var quotesView = new PredictionNote.Views.Quotes({
      collection: PredictionNote.Collections.quotes
    });

    this._swapView(quotesView);
  },

  predictions: function () {
    PredictionNote.Collections.predictions.fetch();
    debugger;

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
