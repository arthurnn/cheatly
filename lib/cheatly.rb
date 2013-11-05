require "base64"
require "json"

require "httparty"
require "pager"

require "cheatly/sheet"
require "cheatly/version"

module Cheatly
  class CLI
    include Pager

    def initialize(args)
      @command = args.shift
      @handle = args.first
    end

    def sheet(handle)
      sheet = Sheet.find(handle)
      page
      puts "#{sheet.title}:"
      puts sheet.to_s
    end

    def process
      sheet(@handle)
    end
  end
end
