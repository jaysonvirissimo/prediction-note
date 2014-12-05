window.QuoteView = Backbone.View.extend({
  template: _.template(
    "<div class='item'>" +
    "<blockquote>" +
    "<div class='row'>" +
    "<div class='col-lg-offset-2 col-lg-9'>" +
    "<p><%= quote %></p>" +
    "<small><%= author %></small>" +
    "</div>" +
    "</div>" +
    "</blockquote>" +
    "</div>"
  ),

  initialize: function(){
    this.model.on('change', this.render, this);
    this.model.on('destroy hide', this.remove, this);
  },

  render: function(){
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  },

  remove: function(){
    this.$el.remove();
  }
});
