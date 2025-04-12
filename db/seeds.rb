# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Helper functions
def recipe_tags(recipe, tag_names, tags)
  tag_names.each do |name|
    tag = tags[normalize_key(name)]
    raise "Missing tag: #{name}" unless tag
    recipe.tags << tag
  end
end

def normalize_key(name)
  name.downcase.gsub(/\s+/, "_").to_sym
end

# Users
admin = User.create!(
  email: 'admin@email.com',
  password: '123admin321!'
)

## COCKTAIL TAGS ##
tags = {}

# Spirits
spirits = %w[Vodka Tequila Mezcal Whiskey Bourbon Rye Gin Rum Amaretto Cachaca]
spirit_color = '#D4DADE'

spirits.each do |spirit|
  tags[normalize_key(spirit)] = Tag.find_or_create_by!(name: spirit, color: spirit_color)
end

# Misc
misc = {
  'Absinthe' => '#B1F2B6',
  'Bitters' => '#D5C5BA'
}
misc.each do |name, color|
  tags[normalize_key(name)] = Tag.create!(name: name, color: color)
end

# Tasting notes
tasting_notes = {
  'Balanced' => '#F6DDCC',
  'Spirit Forward' => '#DFB662',
  'Tart' => '#D6F660',
  'Sweet' => '#F1948A',
  'Sour' => '#BDEA61',
  'Refreshing' => '#A3E4D7',
  'Fruity' => '#FFAA99',
  'Savory' => '#B6A58B'
}
tasting_notes.each do |name, color|
  tags[normalize_key(name)] = Tag.create!(name: name, color: color)
end

# Citrus
citrus = {
  'Lemon' => '#F7DC6F',
  'Lime' => '#7DCEA0',
  'Orange' => '#FFA143'
}
citrus.each do |name, color|
  tags[normalize_key(name)] = Tag.create!(name: name, color: color)
end

# Flavors
flavors = {
  'Peach' => '#FFC478',
  'Raspberry' => '#F3B3C2',
  'Cranberry' => '#F3C3C9',
  'Grapefruit' => '#F8C471',
  'Cherry' => '#F9B5B5',
  'Nutty' => '#D5A253',
  'Cinnamon' => '#E6C1A1'
}
flavors.each do |name, color|
  tags[normalize_key(name)] = Tag.create!(name: name, color: color)
end

# Herbs
herbs = {
  'Mint' => '#98FB98',
  'Basil' => '#7DCEA0'
}
herbs.each do |name, color|
  tags[normalize_key(name)] = Tag.create!(name: name, color: color)
end

# Texture
textures = {
  'Frothy' => '#A9CCE3'
}
textures.each do |name, color|
  tags[normalize_key(name)] = Tag.create!(name: name, color: color)
end

## COCKTAIL RECIPES ##
black_widow = Recipe.create!(
  name: 'Black Widow',
  creator: admin,
  recipe_type: :cocktail,
  ingredients: [
    "1.5oz Tequila",
    "1oz Lemon Juice",
    "0.5oz Blackberry Rosemary"
  ],
  directions: <<~HEREDOC
    Shake & Strain into a coupe
    Garnish with a dried lemon wheel
  HEREDOC
)
recipe_tags(black_widow, %w[tequila tart lemon], tags)

princess_peach = Recipe.create!(
  name: 'Princess Peach',
  creator: admin,
  recipe_type: :cocktail,
  ingredients: [
    "2oz Peach & Orange Blossom Vodka",
    "0.5oz Peach Schnapps",
    "1oz Lemon Juice",
    "0.5oz Orange Juice",
    "0.5oz Simple Syrup",
    "Sprite"
  ],
  directions: <<~HEREDOC
    Shake & Pour into a tall glass
    Top with sprite
    Garnish with an orange wheel half
  HEREDOC
)
recipe_tags(princess_peach, %w[vodka sweet lemon peach], tags)

green_tea_shot = Recipe.create!(
  name: 'Green Tea Shot',
  recipe_type: :cocktail,
  ingredients: [
    "0.75oz Jameson",
    "0.75oz Peach Schnapps",
    "0.75oz Sweet & Sour Mix"
  ],
  directions: <<~HEREDOC
    Shake & Strain into a shot glass
  HEREDOC
)
recipe_tags(green_tea_shot, %w[whiskey sour lemon lime peach], tags)

sweet_baby_k = Recipe.create!(
  name: 'Sweet Baby K',
  creator: admin,
  recipe_type: :cocktail,
  ingredients: [
    "1.5oz Peach Bourbon",
    "1oz Lemon Juice",
    "0.5oz Simple Syrup",
    "Sprite"
  ],
  directions: <<~HEREDOC
    Shake with mint & Pour into a tall glass
    Top with sprite
    Garnish with a lime
  HEREDOC
)
recipe_tags(sweet_baby_k, %w[whiskey sweet lemon mint], tags)

lemon_drop_martini = Recipe.create!(
  name: 'Lemon Drop Martini',
  recipe_type: :cocktail,
  ingredients: [
    "1.5oz Vodka",
    "0.75oz Lemon Juice",
    "0.75oz Simple Syrup"
  ],
  directions: <<~HEREDOC
    Sugar the rim of a coupe
    Shake ingredients & Strain
    Garnish with a lemon wheel
  HEREDOC
)
recipe_tags(lemon_drop_martini, %w[vodka tart lemon], tags)

margarita = Recipe.create!(
  name: 'Margarita',
  recipe_type: :cocktail,
  ingredients: [
    "1.5oz Tequila",
    "1oz Lime Juice",
    "0.5oz Triple Sec",
    "Sweet & Sour Mix"
  ],
  directions: <<~HEREDOC
    Salt the rim of a tall glass
    Build ingredients and top with Sweet & Sour Mix
    Garnish with lime wedge
  HEREDOC
)
recipe_tags(margarita, %w[tequila sour lime], tags)

smoked_old_fashioned = Recipe.create!(
  name: 'Smoked Old Fashioned',
  recipe_type: :cocktail,
  ingredients: [
    "2oz Bourbon",
    "0.5oz Simple Syrup",
    "4 drops of orange bitters"
  ],
  directions: <<~HEREDOC
    Shake the bourbon in a smoked shaker
    Add the simple syrup and stir with a big ice cube
    Garnish with an orange twist, cherry, and bitters
  HEREDOC
)
recipe_tags(smoked_old_fashioned, %w[bourbon spirit_forward orange], tags)

caipirinha = Recipe.create!(
  name: 'Caipirinha',
  recipe_type: :cocktail,
  ingredients: [
    "2oz Cachaca",
    "0.5oz Simple Syrup",
    "4 Lime Wedges"
  ],
  directions: <<~HEREDOC
    Pour ingredients into a short glass
    Muddle 4 lime wedges in glass
    Top with ice and stir
  HEREDOC
)
recipe_tags(caipirinha, %w[cachaca balanced lime refreshing], tags)

ginger_basil_smash = Recipe.create!(
  name: 'Ginger Basil Smash',
  recipe_type: :cocktail,
  ingredients: [
    "1.5oz Old Dominic Bourbon",
    "1oz Lemon Juice",
    "0.5oz Ginger Simple Syrup",
    "Club Soda"
  ],
  directions: <<~HEREDOC
    Shake with 4 basil leaves
    Pour into a tall glass
    Top with club soda
  HEREDOC
)
recipe_tags(ginger_basil_smash, %w[bourbon balanced lemon basil], tags)

oaxacan_old_fashion = Recipe.create!(
  name: 'Oaxacan Old Fashion',
  recipe_type: :cocktail,
  ingredients: [
    "2oz Campo Bravo Reposado",
    "0.5oz Mezcal",
    "0.25oz Simple Syrup",
    "0.25oz Agave Syrup",
    "3 drops of orange & chocolate bitters"
  ],
  directions: <<~HEREDOC
    Stir ingredients
    Pour over a large ice cube in a short glass
    Garnish with an orange twist & bitters
  HEREDOC
)
recipe_tags(oaxacan_old_fashion, %w[tequila mezcal spirit_forward orange], tags)

joshs_jam = Recipe.create!(
  name: "Josh's Jam",
  recipe_type: :cocktail,
  ingredients: [
    "1.5oz Gin",
    "0.5oz Cappelletti",
    "1oz Raspberry Simple Syrup",
    "Dash Orange Juice"
  ],
  directions: <<~HEREDOC
    Shake & Strain into a coupe
    Garnish with a raspberry or lemon twist
  HEREDOC
)
recipe_tags(joshs_jam, %w[gin sweet balanced fruity orange raspberry], tags)

ku_clover = Recipe.create!(
  name: 'K.U. Clover',
  recipe_type: :cocktail,
  ingredients: [
    "1.5oz Gin",
    "0.5oz St. Germain",
    "1oz Lemon Juice",
    "1oz Raspberry Simple Syrup",
    "Egg White"
  ],
  directions: <<~HEREDOC
    Dry shake ingredients with egg whites
    Wet shake & strain into a coupe
    Garnish with a raspberry or lemon twist
  HEREDOC
)
recipe_tags(ku_clover, %w[gin balanced lemon raspberry frothy], tags)

paloma = Recipe.create!(
  name: 'Paloma',
  recipe_type: :cocktail,
  ingredients: [
    "1.5oz Mezcal",
    "1oz Grapefruit Juice",
    "1 Dash of Simple Syrup",
    "1 Dash of Lime Juice",
    "Club Soda"
  ],
  directions: <<~HEREDOC
    Shake & pour into a tall glass
    Top with club soda
  HEREDOC
)
recipe_tags(paloma, %w[tequila balanced refreshing lime grapefruit], tags)

sarah_smile = Recipe.create!(
  name: 'Sarah Smile',
  recipe_type: :cocktail,
  ingredients: [
    "2oz Old Dominic Bourbon?",
    "0.5oz Simple Syrup",
    "Barspoon of Cinnamon Mix",
    "Orange Bitters"
  ],
  directions: <<~HEREDOC
    Stir and pour in a small glass over a big ice cube
    Garnish with an orange twist and bitters
  HEREDOC
)
recipe_tags(sarah_smile, %w[bourbon spirit_forward orange cinnamon], tags)

sazerac = Recipe.create!(
  name: 'Sazerac',
  recipe_type: :cocktail,
  ingredients: [
    "1.5oz Sazerac Rye",
    "0.5oz Simple Syrup",
    "5 Dashes of Paychaud's Bitters",
    "Absinthe"
  ],
  directions: <<~HEREDOC
    Mist glass with Absinthe
    Stir ingredients and pour over a big ice cube
    Garnish with a lemon twist
  HEREDOC
)
recipe_tags(sazerac, %w[rye spirit_forward bitters absinthe], tags)

whiskey_sour = Recipe.create!(
  name: 'Whiskey Sour',
  recipe_type: :cocktail,
  ingredients: [
    "1.5oz Old Dominic Bourbon",
    "1oz Lemon Juice",
    "0.5oz Simple Syrup",
    "4 Dashes of Spiced Cherry Bitters"
  ],
  directions: <<~HEREDOC
    Add egg whites and dry shake ingredients
    Wet shake and strain over a big cube
    Garnish with a cherry and lemon slice
  HEREDOC
)
recipe_tags(whiskey_sour, %w[bourbon sour lemon cherry], tags)

amaretto_sour = Recipe.create!(
  name: 'Amaretto Sour',
  recipe_type: :cocktail,
  ingredients: [
    "1.5oz Amaretto",
    "Sweet & Sour Mix"
  ],
  directions: <<~HEREDOC
    Build ingredients into a short glass with ice
    Garnish with a cherry
  HEREDOC
)
recipe_tags(amaretto_sour, %w[amaretto sweet lemon lime nutty], tags)

bloody_mary = Recipe.create!(
  name: 'Bloody Mary',
  recipe_type: :cocktail,
  ingredients: [
    "1.5oz Vodka",
    "Bloody Mary Mix"
  ],
  directions: <<~HEREDOC
    Salt rim of a tall glass
    Build ingredients over ice
    Garnish with 2 olives and a lime wedge
  HEREDOC
)
recipe_tags(bloody_mary, %w[vodka savory lime], tags)

cosmopolitan = Recipe.create!(
  name: 'Cosmopolitan',
  recipe_type: :cocktail,
  ingredients: [
    "1.5oz Vodka",
    "0.5oz Triple Sec",
    "0.5oz Lime Juice",
    "1oz Cranberry Juice"
  ],
  directions: <<~HEREDOC
    Shake ingredients and strain in a coupe
    Garnish with an orange twist
  HEREDOC
)
recipe_tags(cosmopolitan, %w[vodka sweet lime cranberry], tags)
