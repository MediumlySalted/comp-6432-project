# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Users
User.create!(
  email: 'admin@email.com',
  password: '123admin321!'
)

## COCKTAIL TAGS ##
# Spirits
vodka = Tag.create!(
  name: 'Vodka',
  color: '#E5E7E9'
)
tequila = Tag.create!(
  name: 'Tequila',
  color: '#E5E7E9'
)
mezcal = Tag.create!(
  name: 'Mezcal',
  color: '#E5E7E9'
)
whiskey = Tag.create!(
  name: 'Whiskey',
  color: '#E5E7E9'
)
bourbon = Tag.create!(
  name: 'Bourbon',
  color: '#E5E7E9'
)
rye = Tag.create!(
  name: 'Rye',
  color: '#E5E7E9'
)
gin = Tag.create!(
  name: 'Gin',
  color: '#E5E7E9'
)
rum = Tag.create!(
  name: 'Rum',
  color: '#E5E7E9'
)

# Liqueurs
amaretto = Tag.create!(
  name: 'Amaretto',
  color: '#E5E7E9'
)
cachaca = Tag.create!(
  name: 'Cachaca',
  color: '#E5E7E9'
)

# Misc
absinthe = Tag.create!(
  name: 'Absinthe',
  color: '#B1F2B6' # light mint green, reflecting the herbal nature of absinthe
)

bitters = Tag.create!(
  name: 'Bitters',
  color: '#D35400' # dark orange, capturing the rich, complex bitterness
)

# Tasting notes
balanced = Tag.create!(
  name: 'Balanced',
  color: '#F6DDCC'
)
spirit_forward = Tag.create!(
  name: 'Spirit Forward',
  color: '#DFB662'
)
tart = Tag.create!(
  name: 'Tart',
  color: '#D6F660'
)
sweet = Tag.create!(
  name: 'Sweet',
  color: '#F1948A'
)
sour = Tag.create!(
  name: 'Sour',
  color: '#BDEA61'
)
refreshing = Tag.create!(
  name: 'Refreshing',
  color: '#A3E4D7'
)
fruity = Tag.create!(
  name: 'Fruity',
  color: '#FFAA99'
)
savory = Tag.create!(
  name: 'Savory',
  color: "#E5E7E9"
)

# Citrus
lemon = Tag.create!(
  name: 'Lemon',
  color: '#F7DC6F'
)
lime = Tag.create!(
  name: 'Lime',
  color: '#7DCEA0'
)
orange = Tag.create!(
  name: 'Orange',
  color: '#FFA143'
)

# Flavors
peach = Tag.create!(
  name: 'Peach',
  color: '#FFC478'
)

raspberry = Tag.create!(
  name: 'Raspberry',
  color: '#E74C3C'
)

cranberry = Tag.create!(
  name: 'Cranberry',
  color: '#C0392B'
)

grapefruit = Tag.create!(
  name: 'Grapefruit',
  color: '#F8C471'
)

cherry = Tag.create!(
  name: 'Cherry',
  color: '#B03A2E'
)

# Misc
mint = Tag.create!(
  name: 'Mint',
  color: '#98FB98'
)

basil = Tag.create!(
  name: 'Basil',
  color: '#7DCEA0'
)

nutty = Tag.create!(
  name: 'Nutty',
  color: '#D5A253'
)

cinnamon = Tag.create!(
  name: 'Cinnamon',
  color: '#A04000'
)

# Texture
frothy = Tag.create!(
  name: 'Frothy',
  color: '#A9CCE3'
)

## COCKTAIL RECIPES ##
black_widow = Recipe.create!(
  name: 'Black Widow',
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
black_widow.tags << [ tequila, tart, lemon ]

princess_peach = Recipe.create!(
  name: 'Princess Peach',
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
princess_peach.tags << [ vodka, sweet, lemon, peach ]

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
green_tea_shot.tags << [ whiskey, sour, lemon, lime, peach ]

sweet_baby_k = Recipe.create!(
  name: 'Sweet Baby K',
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
sweet_baby_k.tags << [ whiskey, sweet, lemon, mint ]

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
lemon_drop_martini.tags << [ vodka, tart, lemon ]

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
margarita.tags << [ tequila, sour, lime ]

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
smoked_old_fashioned.tags << [ bourbon, spirit_forward, orange ]

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
caipirinha.tags << [ cachaca, balanced, lime, refreshing ]

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
ginger_basil_smash.tags << [ bourbon, balanced, lemon, basil ]

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
oaxacan_old_fashion.tags << [ tequila, mezcal, spirit_forward, orange ]

joshs_jam = Recipe.create!(
  name: 'Josh\'s Jam',
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
joshs_jam.tags << [ gin, sweet, balanced, fruity, orange, raspberry ]

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
ku_clover.tags << [ gin, balanced, lemon, raspberry, frothy ]

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
paloma.tags << [ tequila, balanced, refreshing, lime, grapefruit ]

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
sarah_smile.tags << [ bourbon, spirit_forward, orange, cinnamon ]

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
sazerac.tags << [ rye, spirit_forward, bitters, absinthe ]

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
whiskey_sour.tags << [ bourbon, sour, lemon, cherry ]

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
amaretto_sour.tags << [ amaretto, sweet, lemon, lime, nutty ]

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
bloody_mary.tags << [ vodka, savory ] # Add tomato

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
cosmopolitan.tags << [ vodka, sweet, lime, cranberry ]
