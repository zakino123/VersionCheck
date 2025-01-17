require 'rails_helper'

RSpec.describe "weight_histroys/show", type: :view do
  before(:each) do
    assign(:weight_histroy, WeightHistroy.create!(
      user: nil,
      weight: 2,
      memo: "Memo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Memo/)
  end
end
