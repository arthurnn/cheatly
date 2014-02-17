require "base64"
require "octokit"

module Cheatly
  module Adapter
    class GitHub
      FOLDER = 'sheets'
      REPO = 'arthurnn/cheatly'

      def find(path)
        response = Octokit.contents(REPO, path: "#{FOLDER}/#{path}.md")
        Base64.decode64(response.content)
      end

      def all
        response = Octokit.contents(REPO, path: "#{FOLDER}")
        response.map { |f| f.name.gsub(/\.[a-z]+\z/, '') }
      end

      def create(name, body)
        raise NotImplementedError
      end

      def update(name, body)
        raise NotImplementedError
      end
    end
  end
end
