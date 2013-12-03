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
      @adapter ||= Cheatly::Adapter::GitHub.new
    end

    def self.with_file_adapter
      @adapter = Cheatly::Adapter::File.new
      self
    end

    private

      def adapter
        self.class.adapter
      end
  end
end
