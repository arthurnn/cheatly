require 'test_helper'

describe Cheatly::Sheet do
  it 'find sheet' do
    sheet = Cheatly::Sheet.find("bash")
    assert sheet
  end

  it 'for #all return array' do
    sheets = Cheatly::Sheet.all
    assert sheets.is_a?(Array)
    assert sheets.any?
  end
end
