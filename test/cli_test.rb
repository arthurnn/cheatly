require 'test_helper'

class CliTest < MiniTest::Test

  def test_list
    cli = Cheatly::CLI.new([], nopaginate: true)
    cli.list

    cli = Cheatly::CLI.new([], local: true, nopaginate: true)
    cli.list
  end

  def test_show
    cli = Cheatly::CLI.new([], nopaginate: true)
    cli.show "help"
  end

  def test_help
    cli = Cheatly::CLI.new([], nopaginate: true)
    cli.help
  end
end
