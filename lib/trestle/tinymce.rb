require "trestle"

module Trestle
  module TinyMCE
    require_relative "tinymce/version"
    require_relative "tinymce/configuration"
    require_relative "tinymce/field"
  end

  Configuration.option :tinymce, TinyMCE::Configuration.new
end

require_relative "tinymce/engine" if defined?(Rails)
