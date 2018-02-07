require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:user1) { User.create!(email: 'example@gmail.com', password: 'bagels') }
  let(:user2) { User.create!(email: 'example2@gmail.com', password: 'muffins') }
  let(:eggplant) do
  Recipe.create(user_id: user1.id,
                name: 'Spicy Eggplant',
                edamam_id:
                'http://www.edamam.com/ontologies/edamam.owl#recipe_a53ef6c8495adcb9f2859b1e5d99e9ba')
end

  describe 'show' do
    it 'returns a success status if the recipe is found' do
      sign_in user1
      allow(controller).to receive(:recipe_dto_from_api)
      get :show, params: { id: eggplant.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns a 404 error if the recipe is not found' do
      sign_in user1
      allow(controller).to receive(:recipe_dto_from_api)
      get :show, params: { id: 'Blue' }
      expect(response).to have_http_status(:not_found)
    end
  end
  describe 'destroy' do
    it 'allows an authenticated user to destroy a recipe they created' do
      sign_in user1
      delete :destroy, params: { id: eggplant.id }
      user1.recipes.reload
      expect(user1.recipes).not_to include(eggplant)
    end

    it 'does not allow an unauthenticated user to destroy a recipe' do
      delete :destroy, params: { id: eggplant.id }
      user1.recipes.reload
      expect(user1.recipes).to include(eggplant)
    end
  end
end