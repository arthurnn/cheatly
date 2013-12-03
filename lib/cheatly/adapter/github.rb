require 'httparty'

module Cheatly
  module Adapter
    class GitHub
      include ::HTTParty
      base_uri 'https://api.github.com'

      def headers
        { :headers => {"User-Agent" => "Cheatly Gem"} }
      end

      def base_path
        "/repos/arthurnn/cheatly/contents/sheets"
      end

      def find(path)
        response = self.class.get("#{base_path}/#{path}.yml", headers)
        json = JSON.parse(response.body)
        sheet_yaml = Base64.decode64(json["content"])
        yml = YAML.load(sheet_yaml).first
        [yml.first, yml.last]
      end

      def all
        response = self.class.get(base_path, headers)
        json = JSON.parse(response.body)
        json.map { |entry| entry["name"].gsub('.yml', '') }
      end

      def create
        raise NotImplementedError
      end
    end
  end
end
