module Cheatly
  class Sheet
    attr_accessor :title, :body

    def initialize(title, body = nil, options = {})
      @title, @body = title, body
      @persisted = options[:persisted] || false
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
      self.new(name, body, persisted: true)
    rescue Octokit::NotFound, Octokit::TooManyRequests
      puts "Octokit error."
      nil
    rescue RuntimeError => e
      puts e.message
    end

    def self.all
      handles = adapter.all
      handles.map { |h| Sheet.new(h, nil) }
    end

    def self.adapter
      @adapter ||= Cheatly::Adapter::GitHub.new
    end

    private

      def adapter
        self.class.adapter
      end
  end

  class LocalSheet < Sheet
    def self.adapter
      @adapter ||= Cheatly::Adapter::File.new
    end
  end
end
