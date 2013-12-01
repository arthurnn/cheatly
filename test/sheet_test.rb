require File.expand_path '../test_helper.rb', __FILE__

class SheetTest < MiniTest::Unit::TestCase
  def test_sheet_list
    assert Cheatly::Sheet.all
  end
end
