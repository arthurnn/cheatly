require 'test_helper'

class SheetTest < MiniTest::Test
  def test_sheet_list
    sheets = Cheatly::Sheet.all
    assert sheets.is_a?(Array)
    assert sheets.any?
  end

  def test_sheet_find
    assert Cheatly::Sheet.find("bash")
    assert Cheatly::LocalSheet.find("bash")
  end

  def test_sheet_not_found
    assert_nil Cheatly::Sheet.find("foo")
  end

  def test_write_sheet
    sheet = Cheatly::Sheet.new("foo")
    assert_raises(NotImplementedError) { sheet.save }

    sheet = Cheatly::LocalSheet.new("foobar")
    sheet.body = "foobar"
    sheet.save

    assert_nil Cheatly::Sheet.find("foobar")
    assert Cheatly::LocalSheet.find("foobar")
  end
end
