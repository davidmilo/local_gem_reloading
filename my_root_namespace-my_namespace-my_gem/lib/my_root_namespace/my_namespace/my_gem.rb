# frozen_string_literal: true

require "http"
require "zeitwerk"
loader = Zeitwerk::Loader.for_gem_extension(MyRootNamespace::MyNamespace)
loader.enable_reloading if ENV["LOCAL_GEM_RELOADING"]
loader.setup

module MyRootNamespace
  module MyNamespace
    module MyGem
      def self.do_something
        Something.new.do
      end
    end
  end
end
