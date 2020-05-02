class Cocktail < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :ingredients, through :doses, presence: true
    has_many :doses, presence: true, dependent: :destroy
end
