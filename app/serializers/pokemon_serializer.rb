class PokemonSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :created_at
end
