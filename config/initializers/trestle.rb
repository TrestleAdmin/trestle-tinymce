Trestle.configure do |config|
  config.tinymce.default.configure do |c|
    c.skin = "trestle"
    c.selector = "textarea.tinymce"
    c.branding = false
    c.elementpath = false
    c.menubar = false
    c.statusbar = false
    c.plugins = [
      :lists,
      :link,
      :image,
      :charmap,
      :table,
      :code,
      :hr,
      :paste
    ]
    c.toolbar = [
      "styleselect | bold italic underline strikethrough | subscript superscript hr | alignleft aligncenter alignright alignjustify",
      "bullist numlist | indent outdent | undo redo | link unlink | image charmap table | code"
    ]
    c.link_context_toolbar = true
    c.convert_urls = false
    c.file_picker_types = 'image'
    c.file_picker_callback = "function (cb, value, meta) {
      var input = document.createElement('input');
      input.setAttribute('type', 'file');
      input.setAttribute('accept', 'image/*');

      input.onchange = function () {
        var file = this.files[0];

        var reader = new FileReader();
        reader.onload = function () {
          var id = 'blobid' + (new Date()).getTime();
          var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
          var base64 = reader.result.split(',')[1];
          var blobInfo = blobCache.create(id, file, base64);
          blobCache.add(blobInfo);

          cb(blobInfo.blobUri(), { title: file.name });
        };
        reader.readAsDataURL(file);
      };

      input.click();
    }"
  end

  config.hook(:javascripts) do
    config = TinyMCE::Rails::Configuration.new(Trestle.config.tinymce.default.as_json.with_indifferent_access)

    tinymce_assets +
      javascript_include_tag("trestle/tinymce") +
      javascript_tag("Trestle.TinyMCE.default = #{config.to_javascript};")
  end

  config.form_field :tinymce, Trestle::TinyMCE::Field
  config.form_field :editor, Trestle::TinyMCE::Field
end
