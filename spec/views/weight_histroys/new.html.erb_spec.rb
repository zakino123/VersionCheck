require 'rails_helper'

RSpec.describe 'weight_histroys/new' do
  before do
    assign(:weight_histroy, WeightHistroy.new(
                              user: nil,
                              weight: 1,
                              memo: 'MyString'
                            ))
  end

  it 'renders new weight_histroy form' do
    render

    assert_select 'form[action=?][method=?]', weight_histroys_path, 'post' do
      assert_select 'input[name=?]', 'weight_histroy[user_id]'

      assert_select 'input[name=?]', 'weight_histroy[weight]'

      assert_select 'input[name=?]', 'weight_histroy[memo]'
    end
  end
end
