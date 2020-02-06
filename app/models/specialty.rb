class Specialty < ApplicationRecord
  has_many :doctors, through: :connects
end
