describe('crawly.views.RoomView', function() {
  describe('render', function() {
    it('should setup all collapsible elements', function() {
      spyOn($.fn, 'collapse');
      var view = new crawly.views.RoomView();
      view.render();

      expect($.fn.collapse).toHaveBeenCalled();
      expect($.fn.collapse.mostRecentCall.object.selector).toEqual('.collapse');
    })
  });
});