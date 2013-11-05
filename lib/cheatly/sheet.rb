module Cheatly
  class Sheet
    attr_accessor :title, :body
    def initialize(title, body)
      @title, @body = title, body
    end

    def to_s
      "  #{@body.gsub("\r",'').gsub("\n", "\n  ")}"
    end

    def self.create(title, body)
      adapter.create(title, body)
    end

    def self.find(handle)
      t, b = adapter.find(handle)
      Sheet.new(t, b)
    end

    def self.all
      handles = adapter.all
      handles.map { |h| Sheet.new(h, nil) }
    end

    def self.adapter
      @adapter ||= GithubAdapter.new
    end

    def self.with_file_adapter
      @adapter = FileAdapter.new
      self
    end
  end

  class FileAdapter
    def find(name)
      path = "sheets/#{name}.yml"
      sheet_yaml = File.read(path)
      yml = YAML.load(sheet_yaml).first
      [yml.first, yml.last]
    end

    def all
      Dir["sheets/*.yml"].map { |f| f.scan(/sheets\/(.*).yml/)[0][0] }
    end

    def create(name, body)
      body = {name => body}.to_yaml
      f = File.new "sheets/#{name}.yml", "w"
      f.write(body)
      f.close
    end
  end

  class GithubAdapter
    include HTTParty
    base_uri 'https://api.github.com'

    def base_path
      "/repos/arthurnn/cheatly/contents/sheets"
    end

    def find(path)
      response = self.class.get("#{base_path}/#{path}.yml")
      json = JSON.parse(response.body)
      sheet_yaml = Base64.decode64(json["content"])
      yml = YAML.load(sheet_yaml).first
      [yml.first, yml.last]
    end

    def all
      response = self.class.get(base_path)
      json = JSON.parse(response.body)
      json.map { |entry| entry["name"].gsub('.yml', '') }
    end

    def create
      raise NotImplementedError
    end
  end
end
