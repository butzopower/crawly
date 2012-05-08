describe('crawly.admin.views.RoomFormView', function() {
  var html, view;
  beforeEach(function() {
    html = '<form id="room-form">' +
        '<ul class="exits">' +
          '<li>' +
            'Foo Bar' +
            '<a class="close">X</a>' +
            '<input type="hidden" class="destroy-field" name="foo[_destroy]" value="0"/>' +
          '</li>' +
        '</ul>' +
      '</form>';

    setFixtures(html);
    view = new crawly.admin.views.RoomFormView({el: $('#room-form')});
  });

  describe('clicking the exit X link', function() {
    it('should hide the corresponding li', function() {
      expect(view.$el.find('.exits li:first-child')).toBeVisible();
      view.$el.find('.exits li:first-child a.close').click();
      expect(view.$el.find('.exits li:first-child')).not.toBeVisible();
    });

    it('should add a hidden input to remove the field', function() {
      view.$el.find('.exits li:first-child a.close').click();
      expect(view.$el.find('input.destroy-field').prop('value')).toEqual('1');

    });
  });
});