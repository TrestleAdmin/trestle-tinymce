require "tinymce/rails"

module Trestle
  module TinyMCE
    class Engine < Rails::Engine
      if config.respond_to?(:assets)
        config.assets.precompile << "trestle/tinymce.manifest.js" # Sprockets 4 manifest
        config.assets.precompile << "trestle/tinymce.js"          # Sprockets 3
      end
    end
  end
end
