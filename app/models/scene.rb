class Scene < ApplicationRecord
  belongs_to :adventure, foreign_key: "adventure_id"
end
