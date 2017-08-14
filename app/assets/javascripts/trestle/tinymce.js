Trestle.TinyMCE = {};

Trestle.ready(function() {
  function init() {
    if (typeof(tinyMCE) !== 'undefined') {
      tinyMCE.init(Trestle.TinyMCE.default);
    } else {
      setTimeout(init, 50);
    }
  }

  init();
});
