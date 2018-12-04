class Adventure < ApplicationRecord
  has_many :scenes, dependent: :destroy
end
