require "cheatly/version"

module Cheatly
  autoload :Sheet, "cheatly/sheet"
  autoload :CLI, "cheatly/cli"

  module Adapter
    autoload :File, "cheatly/adapter/file"
    autoload :GitHub, "cheatly/adapter/github"
  end
end
