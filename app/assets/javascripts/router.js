window.PredictionNote = new (Backbone.Router.extend({
  routes: {
    "": "quotes"
  },

  initialize: function(){
    this.quotes = new Quotes();
    this.quotesView = new QuotesView({collection: this.quotes});
    this.quotesView.render();
  },

  quotes: function(){
    $(".carousel-inner").html(this.quotesView.el);
    this.quotes.fetch({
      success: function () {
        $('.item').first().attr("class", "item active");
        $('#quote-carousel').carousel({
          pause: true,
          interval: 5000
        });
      }
    });
  },

  start: function(){
    Backbone.history.start();
  }
}));
