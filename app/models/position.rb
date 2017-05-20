class Position < ApplicationRecord
  belongs_to :candidate

  validates_presence_of :company_name, :title, :candidate_id, :date_from

  validates_length_of :company_name, maximum: 150
  validates_length_of :title, maximum: 50
  validates_length_of :date_from, is: 7
  validates_length_of :date_to, is: 7, allow_blank: true
end
