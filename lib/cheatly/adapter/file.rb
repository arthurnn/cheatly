require "tempfile"
require "yaml"

module Cheatly
  module Adapter
    class File
      def find(name)
        path = "sheets/#{name}.yml"
        sheet_yaml = ::File.read(path)
        yml = YAML.load(sheet_yaml).first
        [yml.first, yml.last]
      end

      def all
        Dir["sheets/*.yml"].map { |f| f.scan(/sheets\/(.*).yml/)[0][0] }
      end

      def create(name, body)
        body = {name => body}.to_yaml
        f = ::File.new("sheets/#{name}.yml", "w")
        f.write(body)
        f.close
      end

      def update(name, body)
        ::File.delete("sheets/#{name}.yml")
        create(name, body)
      end
    end
  end
end
