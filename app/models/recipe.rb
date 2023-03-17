class Recipe < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'
    has_many :recipe_foods, dependent: :destroy
    has_many :foods, through: :recipe_foods
  
    validates :name, :preparation_time, :cooking_time, :description, presence: true
  end