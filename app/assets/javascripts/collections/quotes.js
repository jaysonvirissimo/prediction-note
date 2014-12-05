window.Quotes = Backbone.Collection.extend({
  model: Quote,
  url: 'api/quotes',

  initialize: function(){
    this.on('remove', this.hideModel, this);
  },

  hideModel: function(model){
    model.trigger('hide');
  },

  focusOnQuote: function(id) {
    var modelsToRemove = this.filter(function(quote){
      return quote.id != id;
    });

    this.remove(modelsToRemove);
  }
})
