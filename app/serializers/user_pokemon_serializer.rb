class UserPokemonSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :user_id, :pokemon_id, :created_at
end
