Trestle.TinyMCE = {};

// Initialize TinyMCE on targets within initialization scope
Trestle.init(function(e, root) {
  $(root).find('textarea.tinymce').each(function() {
    var id = $(this).attr('id');
    var editor = tinyMCE.get(id);
    if (editor) { editor.remove(); }
  });

  tinyMCE.init(Trestle.TinyMCE.default);
});

// Fix focus issues within Bootstrap modals
$(document).on('focusin', function(e) {
  if ($(e.target).closest(".mce-window").length) {
    e.stopImmediatePropagation();
  }
});
