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
      unless sheet
        puts "Sheet not found, run 'cheatly list' to see the availables."
        return
      end
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
      sheet = Sheet.with_file_adapter.new(handle)
      sheet.body = write_to_tempfile(handle)
      sheet.save
    end

    def edit(handle)
      sheet = Sheet.with_file_adapter.find(handle)
      sheet.body = write_to_tempfile(handle, sheet.body)
      sheet.save
    end

    def write_to_tempfile(title, body = nil)
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
      when "edit"
        edit(@handle)
      else
        puts "Command [#{@command}] not found :-( . You can try running 'cheatly list' to check the available commands. "
      end
    end
  end
end
