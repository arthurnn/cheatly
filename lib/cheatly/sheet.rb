module Cheatly
  class Sheet
    attr_accessor :title, :body

    def initialize(title, body = nil, options = {})
      @title, @body = title, body
      @presisted = options[:persisted] || false
    end

    def to_s
      body.to_s
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

    def self.find(name)
      body = adapter.find(name)
      Sheet.new(name, body, persisted: true)
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
      File.read(path)
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
      Base64.decode64(json["content"])
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
