# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
pokemon1 = Pokemon.create(name: "Pikachu")
Info.create(nick_name: 'Pika', pokemon_id: pokemon1.id, pokedex_id: 25)

pokemon2 = Pokemon.create(name: "Raichu")
Info.create(nick_name: 'Ry', pokemon_id: pokemon2.id, pokedex_id: 26)

pokemon3 = Pokemon.create(name: "Grimer")
Info.create(nick_name: 'Gry', pokemon_id: pokemon3.id, pokedex_id: 88)

pokemon4 = Pokemon.create(name: "Weedle")
Info.create(nick_name: 'Wy', pokemon_id: pokemon4.id, pokedex_id: 13)

pokemon5 = Pokemon.create(name: "Blastoise")
Info.create(nick_name: 'Bly', pokemon_id: pokemon5.id, pokedex_id: 9)

pokemon6 = Pokemon.create(name: "Slowking")
Info.create(nick_name: 'Sly', pokemon_id: pokemon6.id, pokedex_id: 199)


# params1 = { info: { pokedex_id: 252, nick_name: 'Try', favorite_color: 'Browsn', favorite_food: 'Insects', pokemon_attributes: { name: 'Treecko' } } }

# params2 = { info: { pokedex_id: 255, nick_name: 'Tuy', favorite_color: 'Browsn', favorite_food: 'Worms', pokemon_attributes: { name: 'Torchic' } } }

# params3 = { info: { pokedex_id: 258, nick_name: 'Muy', favorite_color: 'Browsn', favorite_food: 'Shrimps', pokemon_attributes: { name: 'Mudkip' } } }