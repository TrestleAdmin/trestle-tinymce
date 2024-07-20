# Trestle TinyMCE Integration (trestle-tinymce)

> TinyMCE integration plugin for the Trestle admin framework


## Getting Started

These instructions assume you have a working Trestle application. To integrate trestle-tinymce, first add it to your application's Gemfile:

```ruby
gem 'trestle-tinymce'
```

Run `bundle install`, and then restart your Rails server.

To add a TinyMCE editor to your form, use the `editor` (or `tinymce`) field type:

```ruby
Trestle.resource(:articles) do
  form do |article|
    editor :content
  end
end
```

The default TinyMCE configuration can be edited by defining options within `config/initializers/trestle.rb`. The default configuration is shown below:

```ruby
Trestle.configure do |config|
  config.tinymce.default.configure do |c|
    c.skin = "trestle/tinymce-6" # or "trestle/tinymce-5" depending on current version of tinymce-rails
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
      :code
    ] # also includes [:hr, :paste] on TinyMCE 5
    c.toolbar = "styleselect | bold italic underline strikethrough | subscript superscript hr | alignleft aligncenter alignright alignjustify | bullist numlist | indent outdent | undo redo | link unlink | image charmap table | code"
    c.toolbar_mode = "floating"
    c.toolbar_sticky = true
    c.link_context_toolbar = true
    c.convert_urls = false
  end
end
```

Custom callbacks can be passed as strings and they will be automatically converted to JavaScript functions. The following example allows images to be uploaded and embedded as blob URLs.

```ruby
Trestle.configure do |config|
  config.tinymce.default.configure do |c|
    c.file_picker_types = "image"
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
end
```

For further information, please see [tinymce-rails](https://github.com/spohlenz/tinymce-rails) and the [TinyMCE documentation](https://www.tiny.cloud/docs/configure/).


## License

The gem is available as open source under the terms of the [LGPLv3 License](https://opensource.org/licenses/LGPL-3.0).
