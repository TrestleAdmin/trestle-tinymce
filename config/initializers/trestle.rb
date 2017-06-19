require "trestle/tinymce/field"

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
      :hr
    ]
    c.toolbar = [
      "styleselect | bold italic underline strikethrough | subscript superscript hr | alignleft aligncenter alignright alignjustify",
      "bullist numlist | indent outdent | undo redo | link unlink | image charmap table | code"
    ]
    c.link_context_toolbar = true
    c.convert_urls = false
  end

  config.hook(:javascripts) do
    config = TinyMCE::Rails::Configuration.new(Trestle.config.tinymce.default.options)

    tinymce_assets +
      javascript_include_tag("trestle/tinymce") +
      javascript_tag("Trestle.TinyMCE.default = #{config.to_javascript};")
  end

  config.form_field :tinymce, Trestle::TinyMCE::Field
  config.form_field :editor, Trestle::TinyMCE::Field
end
