require "trestle"

module Trestle
  module TinyMCE
    require_relative "tinymce/version"
    require_relative "tinymce/configuration"
    require_relative "tinymce/field"

    def self.tinymce_major_version
      ::TinyMCE::Rails::VERSION.split(".")[0].to_i
    end
  end

  Configuration.option :tinymce, TinyMCE::Configuration.new
end

require_relative "tinymce/engine" if defined?(Rails)
