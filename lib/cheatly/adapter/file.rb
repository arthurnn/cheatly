require "tempfile"

module Cheatly
  module Adapter
    class File
      def find(name)
        path = "sheets/#{name}.md"
        ::File.read(path)
      end

      def all
        Dir["sheets/*.md"].map { |f| f.scan(/sheets\/(.*).md/)[0][0] }
      end

      def create(name, body)
        f = ::File.new("sheets/#{name}.md", "w")
        f.write(body)
        f.close
      end

      def update(name, body)
        ::File.delete("sheets/#{name}.md")
        create(name, body)
      end
    end
  end
end
