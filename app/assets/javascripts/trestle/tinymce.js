Trestle.TinyMCE = {};

Trestle.init(function(e, root) {
  tinyMCE.remove();

  function init() {
    if (typeof(tinyMCE) !== 'undefined') {
      tinyMCE.init(Trestle.TinyMCE.default);
    } else {
      setTimeout(init, 50);
    }
  }

  init();
});
