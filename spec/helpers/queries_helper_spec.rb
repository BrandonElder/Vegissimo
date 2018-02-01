require 'rails_helper'
require 'query_result'
require 'recipe_dto'
file = File.read('spec/example1.json')
data_hash = JSON.parse(file)

RSpec.describe QueriesHelper, type: :helper do
  describe 'make_dto' do
    subject(:recipe) do
      QueryResult.store_query_result(data_hash, 'pizza')
      QueryResult.hits[0]
    end
    it 'creates a RecipeDto object from the recipe json data' do
      expect(recipe.make_dto.class).to eq(RecipeDto.new(recipe['recipe']).class)
    end
    it 'creates a RecipeDto object that has the correct values (testing label)' do
      expect(recipe.make_dto.label).to eq(RecipeDto.new(recipe['recipe']).label)
    end
  end
end
