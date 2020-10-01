Trestle.TinyMCE = {};

// Initialize TinyMCE on targets within initialization scope
Trestle.init(function(e, root) {
  $(root).find('textarea.tinymce').each(function() {
    var id = $(this).attr('id');
    var editor = tinyMCE.get(id);
    if (editor) { editor.remove(); }
  });

  var settingTmp = Trestle.TinyMCE.default;
  var functionImageUpload = {
    file_picker_types: 'image',
    file_picker_callback: function(cb, value, meta) {
      var input = document.createElement('input');
      input.setAttribute('type', 'file');
      input.setAttribute('accept', 'image/*');

      input.onchange = function() {
        var file = this.files[0];

        // Note: Now we need to register the blob in TinyMCEs image blob
        // registry.
        var id = 'blobid' + (new Date()).getTime();
        var blobCache = tinymce.activeEditor.editorUpload.blobCache;
        var blobInfo = blobCache.create(id, file);
        blobCache.add(blobInfo);

        // Call the callback and populate the Title field with the file name
        cb(blobInfo.blobUri(), { title: file.name });
      };

      input.click();
    }
  }
  var returnedTarget = Object.assign(settingTmp, functionImageUpload);

  tinyMCE.init(returnedTarget);
});

// Fix focus issues within Bootstrap modals
$(document).on('focusin', function(e) {
  if ($(e.target).closest(".mce-window").length) {
    e.stopImmediatePropagation();
  }
});
