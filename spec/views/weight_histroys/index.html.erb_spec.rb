require 'rails_helper'

RSpec.describe "weight_histroys/index", type: :view do
  before(:each) do
    assign(:weight_histroys, [
      WeightHistroy.create!(
        user: nil,
        weight: 2,
        memo: "Memo"
      ),
      WeightHistroy.create!(
        user: nil,
        weight: 2,
        memo: "Memo"
      )
    ])
  end

  it "renders a list of weight_histroys" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Memo".to_s), count: 2
  end
end
