require "tinymce/rails"

module Trestle
  module TinyMCE
    class Engine < Rails::Engine
      config.assets.precompile << "trestle/tinymce.js"
    end
  end
end
