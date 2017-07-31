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
  end
end
```


## License

The gem is available as open source under the terms of the [LGPLv3 License](https://opensource.org/licenses/LGPL-3.0).
