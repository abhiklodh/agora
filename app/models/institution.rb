class Institution < ApplicationRecord
  belongs_to :user
  has_many :items
  enum kind: { clinic: 0, medical_practice: 1, supplier: 2 }
end
