require 'test_helper'

class SheetTest < MiniTest::Test
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
