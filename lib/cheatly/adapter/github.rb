require "base64"
require "yaml"

require "octokit"

module Cheatly
  module Adapter
    class GitHub
      FOLDER = 'sheets'
      REPO = 'arthurnn/cheatly'

      def find(path)
        response = Octokit.contents(REPO, path: "#{FOLDER}/#{path}.yml")
        sheet_yaml = Base64.decode64(response.content)
        yml = YAML.load(sheet_yaml).first
        [yml.first, yml.last]
      end

      def all
        response = Octokit.contents(REPO, path: "#{FOLDER}")
        response.map { |f| f.name.gsub(/\.[a-z]+\z/, '') }
      end

      def create
        raise NotImplementedError
      end
    end
  end
end
