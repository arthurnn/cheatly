require "base64"
require "json"
require "tempfile"
require "optparse"

require "httparty"
require "pager"

require "cheatly/version"

module Cheatly
  autoload :Sheet, "cheatly/sheet"
  autoload :CLI, "cheatly/cli"
end
