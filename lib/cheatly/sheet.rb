module Cheatly
  class Sheet
    attr_accessor :title, :body
    def initialize(title, body)
      @title, @body = title, body
    end

    def to_s
      "  #{@body.gsub("\r",'').gsub("\n", "\n  ")}"
    end

    def self.find(handle)
      sheet_yaml = adapter.find("sheets/#{handle}.yml")
      yml = YAML.load(sheet_yaml).first
      t, b = yml.first, yml.last
      Sheet.new(t, b)
    end

    def self.all
      handles = adapter.all
      handles.map { |h| Sheet.new(h, nil) }
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

    def all
      Dir["sheets/*.yml"].map { |f| f.scan(/sheets\/(.*).yml/)[0][0] }
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

    def all
      response = self.class.get("#{base_path}/sheets")
      json = JSON.parse(response.body)
      json.map { |entry| entry["name"].gsub('.yml', '') }
    end
  end
end
