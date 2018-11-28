class Scene < ApplicationRecord
  has_many :decisions
  belongs_to :adventure, foreign_key: "adventure_id"
end
