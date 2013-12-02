require 'kramdown/man'

module Cheatly
  class Sheet
    attr_accessor :title, :path

    def initialize(title, path, options = {})
      @title, @path = title, path
      @presisted = options[:persisted] || false
    end

    def create
      adapter.create(title, body)
    end

    def update
      adapter.update(title, body)
    end

    def save
      if @persisted
        update
      else
        create
      end
    end

    def self.find(handle)
      with_file_adapter
      sheet = adapter.find(handle)
      sheet 
    rescue RuntimeError => e
      puts e.message
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

    private

      def adapter
        self.class.adapter
      end
  end

  class FileAdapter
    def find(name)
      path = "sheets/#{name}.md"

      if File.exists?("sheets/#{name}.1")
        return Sheet.new(name, "sheets/#{name}.1", persisted: true)
      end

      sheet_markdown = File.read(path)
      #assume target is manpage for now, but we can do others later
      
      doc = Kramdown::Document.new(sheet_markdown)

      manpage = File.open("./sheets/#{name}.1", "w")
      manpage.write(doc.to_man)
      manpage.close

      Sheet.new(name, manpage.path, persisted: true)
    end

    def all
      Dir["sheets/*.md"].map { |f| f.scan(/sheets\/(.*).md/)[0][0] }
    end

    def create(name, body)
      body = {name => body}.to_yaml
      f = File.new "sheets/#{name}.md", "w"
      f.write(body)
      f.close
    end

    def update(name, body)
      File.delete "sheets/#{name}.md"
      create(name, body)
    end
  end

  class GithubAdapter
    include HTTParty
    base_uri 'https://api.github.com'

    def headers
      { :headers => {"User-Agent" => "Cheatly Gem"} }
    end

    def base_path
      "/repos/arthurnn/cheatly/contents/sheets"
    end

    def find(path)
      response = self.class.get("#{base_path}/#{path}.md", headers)
      json = JSON.parse(response.body)
      sheet_yaml = Base64.decode64(json["content"])
      yml = YAML.load(sheet_yaml).first
      [yml.first, yml.last]
    end

    def all
      response = self.class.get(base_path, headers)
      json = JSON.parse(response.body)
      json.map { |entry| entry["name"].gsub('.md', '') }
    end

    def create
      raise NotImplementedError
    end
  end
end
