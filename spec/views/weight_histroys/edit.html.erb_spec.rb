require 'rails_helper'

RSpec.describe "weight_histroys/edit", type: :view do
  let(:weight_histroy) {
    WeightHistroy.create!(
      user: nil,
      weight: 1,
      memo: "MyString"
    )
  }

  before(:each) do
    assign(:weight_histroy, weight_histroy)
  end

  it "renders the edit weight_histroy form" do
    render

    assert_select "form[action=?][method=?]", weight_histroy_path(weight_histroy), "post" do

      assert_select "input[name=?]", "weight_histroy[user_id]"

      assert_select "input[name=?]", "weight_histroy[weight]"

      assert_select "input[name=?]", "weight_histroy[memo]"
    end
  end
end
