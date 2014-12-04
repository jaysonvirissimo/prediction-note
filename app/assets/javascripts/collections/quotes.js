PredictionNote.Collections.Quotes = Backbone.Collection.extend({
  url: "api/quotes",

  model: PredictionNote.Models.Quote,

  getOrFetch: function (id) {
    var quote = this.get(id);
    var quotes = this;
    if(!quote) {
      quote = new PredictionNote.Models.Quote({ id: id });
      quote.fetch({
        success: function () {
          quotes.add(quote);
        },
      });
    } else {
      quote.fetch();
    }
    return quote;
  }
});

PredictionNote.Collections.quotes = new PredictionNote.Collections.Quotes();
PredictionNote.Collections.quotes.fetch();
