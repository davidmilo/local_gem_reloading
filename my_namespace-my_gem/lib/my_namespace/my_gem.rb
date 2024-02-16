# frozen_string_literal: true

require "http"

require_relative "my_gem/version"

module MyNamespace
  module MyGem
    def self.do_something
      return "A"
      return "B"
    end
  end
end
