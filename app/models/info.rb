class Info < ApplicationRecord
    belongs_to :pokemon
    accepts_nested_attributes_for :pokemon
end
