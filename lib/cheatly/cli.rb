require "pager"
require "optparse"
require "redcarpet"
require "thor"

require "cheatly/version"
require "cheatly/sheet"
require "cheatly/adapter/file"
require "cheatly/adapter/github"
require "cheatly/renderer"

module Cheatly
  class CLI < Thor
    include Pager

    class_option :local, type: :boolean, aliases: "-l", desc: "Run using local file system"

    class_option :nopaginate, type: :boolean, desc: "Disable pagination"

    class_option :test, type: :boolean, desc: "Disable real output"

    desc "show SHEET_NAME", "show a cheat sheet"
    def show(handle)
      sheet = model.find(handle)
      unless sheet
        puts "Sheet not found, run 'cheatly list' to see the availables."
        return
      end
      page unless options[:nopaginate]
      renderer = Renderer.new
      md = Redcarpet::Markdown.new(renderer, no_intra_emphasis: true)
      puts md.render(sheet.to_s) unless options[:test]
    end

    desc "list sheets", "list all available sheets"
    def list
      sheets = model.all
      page unless options[:nopaginate]
      unless options[:test]
        puts "List of available cheat-sheets:"
        sheets.each do |sheet|
          puts "  #{sheet.title}"
        end
      end
    end

    desc "list sheets", "list all available sheets"
    alias_method :ls, :list

    desc "create SHEET_NAME", "create a new sheet cheat"
    def create(handle)
      sheet = LocalSheet.new(handle)
      sheet.body = write_to_tempfile(handle)
      sheet.save
    end

    desc "edit SHEET_NAME", "edit an existent sheet cheat"
    def edit(handle)
      sheet = LocalSheet.find(handle)
      sheet.body = write_to_tempfile(handle, sheet.body)
      sheet.save
    end

    desc "help", "help"
    def help
      show('help') unless options[:test]
    end

    desc "version", "Prints cheatly's version"
    def version
      puts "Cheatly version #{Cheatly::VERSION}"
    end
    map %w(-v --version) => :version

    private

      def model
        if options[:local]
          LocalSheet
        else
          Sheet
        end
      end

      def write_to_tempfile(title, body = nil)
        tempfile = Tempfile.new(title + '.md')
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
  end
end
