require 'rails_helper'

RSpec.describe 'users/edit' do
  let(:user) do
    User.create!(
      name: 'MyString',
      age: 1
    )
  end

  before do
    assign(:user, user)
  end

  it 'renders the edit user form' do
    render

    assert_select 'form[action=?][method=?]', user_path(user), 'post' do
      assert_select 'input[name=?]', 'user[name]'

      assert_select 'input[name=?]', 'user[age]'
    end
  end
end
