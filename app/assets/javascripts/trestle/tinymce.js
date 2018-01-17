Trestle.TinyMCE = {};

Trestle.init(function(e, root) {
  $(root).find('textarea.tinymce').each(function() {
    var id = $(this).attr('id');
    var editor = tinyMCE.get(id);
    if (editor) { editor.remove(); }
  });

  tinyMCE.init(Trestle.TinyMCE.default);
});
