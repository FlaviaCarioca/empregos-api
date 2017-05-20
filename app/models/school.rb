class School < ApplicationRecord
  belongs_to :candidate

  validates_presence_of :name, :date_from, :candidate_id

  validates_length_of :name, maximum: 50
  validates_length_of :degree, maximum: 150, allow_blank: true
  validates_length_of :date_from, is: 7
  validates_length_of :date_to, is: 7, allow_blank: true
end
