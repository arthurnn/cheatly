require "cheatly/version"
require "base64"
require "json"

require "httparty"
require "pager"

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

  class Sheet
    attr_accessor :title, :body
    def initialize(title, body)
      @title, @body = title, body
    end

    def to_s
      " #{@body.gsub("\r",'').gsub("\n", "\n  ")}"
    end

    def self.find(handle)
      sheet_yaml = adapter.find("sheets/#{handle}.yml")
      yml = YAML.load(sheet_yaml).first
      t, b = yml.first, yml.last
      Sheet.new(t, b)
    end

    def self.adapter
#      @adapter ||= FileAdapter.new
      @adapter ||= GithubAdapter.new
    end
  end

  class FileAdapter
    def find(path)
      File.read(path)
    end
  end

  class GithubAdapter
    include HTTParty
    base_uri 'https://api.github.com'

    def base_path
      "/repos/arthurnn/cheatly/contents"
    end

    def find(path)
      response = self.class.get("#{base_path}/#{path}")
      json = JSON.parse(response.body)
      Base64.decode64(json["content"])
    end

  end
end
