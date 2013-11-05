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
      @command = args.shift || "help"
      @handle = args.first

      if "help" == @command
        @handle = @command
        @commands = "show"
      end
    end

    def sheet(handle)
      sheet = Sheet.find(handle)
      page
      puts "#{sheet.title}:"
      puts sheet.to_s
    end

    def list
      sheets = Sheet.all
      page
      puts "List of available cheat-sheets:"
      sheets.each do |sheet|
        puts "  #{sheet.title}"
      end
    end

    def process
      case @command
      when "show"
        sheet(@handle)
      when "list"
        list
      else
        puts "Command [#{@command}] not found. :-("
      end
    end
  end
end
