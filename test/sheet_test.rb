require File.expand_path '../test_helper.rb', __FILE__

class SheetTest < MiniTest::Unit::TestCase
  def test_sheet_find
    sheet = Cheatly::Sheet.find("bash")
    assert sheet
  end

  def test_sheet_list
    sheets = Cheatly::Sheet.all
    assert sheets.is_a?(Array)
    assert sheets.any?
  end
end
