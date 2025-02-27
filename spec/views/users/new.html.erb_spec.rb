require 'rails_helper'

RSpec.describe 'users/new' do
  before do
    assign(:user, User.new(
                    name: 'MyString',
                    age: 1
                  ))
  end

  it 'renders new user form' do
    render

    assert_select 'form[action=?][method=?]', users_path, 'post' do
      assert_select 'input[name=?]', 'user[name]'

      assert_select 'input[name=?]', 'user[age]'
    end
  end
end
