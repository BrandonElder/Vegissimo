class RecipeDto
  attr_accessor :calories, :carbs, :fat, :e_id, :image, :ingredient_list, :label, :protein, :url, :yield, :source

  def initialize(json_object)
    self.calories = get_default(json_object, 'calories')
    self.carbs = get_default(json_object['totalNutrients']['CHOCDF'], 'quantity')
    self.e_id = get_default(json_object, 'uri')
                .match(/_[[:alnum:]]*(\Z || \&)/).to_s[1..-1]
    self.fat = get_default(json_object['totalNutrients']['FAT'], 'quantity')
    self.image = get_default(json_object, 'image')
    self.ingredient_list = get_default(json_object, 'ingredientLines')
    self.label = get_default(json_object, 'label')
    self.protein = get_default(json_object['totalNutrients']['PROCNT'], 'quantity')
    self.url = get_default(json_object, 'url')
    self.yield = get_default(json_object, 'yield')
    self.source = get_default(json_object, 'source')
  end

  def get_default(obj, key, default = nil)
    obj.include?(key) ? obj[key] : default
  end
end
