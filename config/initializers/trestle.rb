require "trestle/tinymce/field"

Trestle.configure do |config|
  config.hook(:javascripts) { tinymce_assets }

  config.form_field :tinymce, Trestle::TinyMCE::Field
  config.form_field :editor, Trestle::TinyMCE::Field
end
