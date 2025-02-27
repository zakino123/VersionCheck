require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/weight_histroys' do
  # This should return the minimal set of attributes required to create a valid
  # WeightHistroy. As you add validations to WeightHistroy, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      WeightHistroy.create! valid_attributes
      get weight_histroys_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      weight_histroy = WeightHistroy.create! valid_attributes
      get weight_histroy_url(weight_histroy)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_weight_histroy_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      weight_histroy = WeightHistroy.create! valid_attributes
      get edit_weight_histroy_url(weight_histroy)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new WeightHistroy' do
        expect do
          post weight_histroys_url, params: { weight_histroy: valid_attributes }
        end.to change(WeightHistroy, :count).by(1)
      end

      it 'redirects to the created weight_histroy' do
        post weight_histroys_url, params: { weight_histroy: valid_attributes }
        expect(response).to redirect_to(weight_histroy_url(WeightHistroy.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new WeightHistroy' do
        expect do
          post weight_histroys_url, params: { weight_histroy: invalid_attributes }
        end.not_to change(WeightHistroy, :count)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post weight_histroys_url, params: { weight_histroy: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested weight_histroy' do
        weight_histroy = WeightHistroy.create! valid_attributes
        patch weight_histroy_url(weight_histroy), params: { weight_histroy: new_attributes }
        weight_histroy.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the weight_histroy' do
        weight_histroy = WeightHistroy.create! valid_attributes
        patch weight_histroy_url(weight_histroy), params: { weight_histroy: new_attributes }
        weight_histroy.reload
        expect(response).to redirect_to(weight_histroy_url(weight_histroy))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        weight_histroy = WeightHistroy.create! valid_attributes
        patch weight_histroy_url(weight_histroy), params: { weight_histroy: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested weight_histroy' do
      weight_histroy = WeightHistroy.create! valid_attributes
      expect do
        delete weight_histroy_url(weight_histroy)
      end.to change(WeightHistroy, :count).by(-1)
    end

    it 'redirects to the weight_histroys list' do
      weight_histroy = WeightHistroy.create! valid_attributes
      delete weight_histroy_url(weight_histroy)
      expect(response).to redirect_to(weight_histroys_url)
    end
  end
end
