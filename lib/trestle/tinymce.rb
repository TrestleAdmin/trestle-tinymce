require "trestle"
require "trestle/tinymce/version"
require "trestle/tinymce/configuration"
require "trestle/tinymce/engine"

Trestle::Configuration.option :tinymce, Trestle::TinyMCE::Configuration.new
