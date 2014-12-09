require 'test_helper'

class CliTest < MiniTest::Test

  def test_list
    begin
      cli = Cheatly::CLI.new([], nopaginate: true, test: true)
      cli.list
    rescue Exception => e
      raise "#{e.message}"
    end

    begin
      cli = Cheatly::CLI.new([], local: true, nopaginate: true, test: true)
      cli.list
    rescue Exception => e
      raise "#{e.message}"
    end

  end

  def test_show
    begin
      cli = Cheatly::CLI.new([], nopaginate: true, test: true)
      cli.show "markdown"
    rescue Exception => e
      raise "#{e.message}"
    end
  end

  def test_help
    begin
      cli = Cheatly::CLI.new([], nopaginate: true, test: true)
      cli.help
    rescue Exception => e
      raise "#{e.message}"
    end
  end
end
