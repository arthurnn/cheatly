require "base64"
require "json"
require "tempfile"
require "optparse"

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

      @options = {}
      op_parser = OptionParser.new do |opts|
        opts.on("-l", "--local", "Run using local file system") do |v|
          @options[:local] = v
        end
      end
      op_parser.parse! args
    end

    def model
      if @options[:local]
        Sheet.with_file_adapter
      else
        Sheet
      end
    end

    def sheet(handle)
      sheet = model.find(handle)
      page
      puts "#{sheet.title}:"
      puts sheet.to_s
    end

    def list
      sheets = model.all
      page
      puts "List of available cheat-sheets:"
      sheets.each do |sheet|
        puts "  #{sheet.title}"
      end
    end

    def create(handle)
      body = write_to_tempfile(handle)
      Sheet.with_file_adapter.create(handle, body)
    end

    def write_to_tempfile(title, body = nil)
      # god dammit i hate tempfile, this is so messy but i think it's
      # the only way.
      tempfile = Tempfile.new(title + '.yml')
      tempfile.write(body) if body
      tempfile.close
      system "#{editor} #{tempfile.path}"
      tempfile.open
      body = tempfile.read
      tempfile.close
      body
    end

    def editor
      ENV['VISUAL'] || ENV['EDITOR'] || "nano"
    end

    def process
      case @command
      when "show"
        sheet(@handle)
      when "list"
        list
      when "new"
        create(@handle)
      else
        puts "Command [#{@command}] not found. :-("
      end
    end
  end
end
