require "cheatly/version"
require "cheatly/sheet"
require "cheatly/adapter/file"
require "cheatly/adapter/github"

require "pager"
require "optparse"
require "redcarpet"

require "cheatly/renderer"
require "thor"

module Cheatly
  class CLI < Thor
    include Pager

    class_option :local, type: :boolean, aliases: "-l", desc: "Run using local file system"

    default_task :help

    desc "show SHEET_NAME", "show a cheat sheet"
    def show(handle)
      sheet = model.find(handle)
      unless sheet
        puts "Sheet not found, run 'cheatly list' to see the availables."
        return
      end
      page
      renderer = Renderer.new
      md = Redcarpet::Markdown.new(renderer, no_intra_emphasis: true)
      puts md.render(sheet.to_s)
    end

    desc "list sheets", "list all available sheets"
    def list
      sheets = model.all
      page
      puts "List of available cheat-sheets:"
      sheets.each do |sheet|
        puts "  #{sheet.title}"
      end
    end

    desc "create SHEET_NAME", ""
    def create(handle)
      sheet = Sheet.with_file_adapter.new(handle)
      sheet.body = write_to_tempfile(handle)
      sheet.save
    end

    desc "edit SHEET_NAME", ""
    def edit(handle)
      sheet = Sheet.with_file_adapter.find(handle)
      sheet.body = write_to_tempfile(handle, sheet.body)
      sheet.save
    end

    private

    def model
      if options[:local]
        Sheet.with_file_adapter
      else
        Sheet
      end
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
  end
end
