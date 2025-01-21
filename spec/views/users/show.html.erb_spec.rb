require 'rails_helper'

RSpec.describe 'users/show' do
  before do
    assign(:user, User.create!(
                    name: 'Name',
                    age: 2
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
