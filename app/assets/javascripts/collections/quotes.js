PredictionNote.Collections.Quotes = Backbone.Collection.extend({
  url: "api/home",

  model: PredictionNote.Models.Quote
});

PredictionNote.Collections.quotes = new PredictionNote.Collections.Quotes();
