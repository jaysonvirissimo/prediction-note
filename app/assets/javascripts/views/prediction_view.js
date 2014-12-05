window.PredictionView = Backbone.View.extend({
  template: _.template(
  "<td>0</td>" +
  "<td><%= status %><%= statement %></td>" +
  "<td><%= deadline %></td>"
  ),

  events: {
    'change input': 'toggleStatus'
  },

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
