class Scene < ApplicationRecord
  has_many :decisions, dependent: :destroy
  belongs_to :adventure, foreign_key: "adventure_id"
  
end
