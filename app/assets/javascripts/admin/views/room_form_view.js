crawly.admin.views.RoomFormView = Backbone.View.extend({
  events: {
    'click .exits a.close' : 'removeExit'
  },

  removeExit: function(e) {
    e.preventDefault();
    var $li = $(e.currentTarget).closest('li');
    $li.find('.destroy-field').attr('value', '1');
    $li.hide();
  }
});