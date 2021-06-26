class Pokemon < ApplicationRecord
    has_many :info
    has_many :user_pokemon
end
