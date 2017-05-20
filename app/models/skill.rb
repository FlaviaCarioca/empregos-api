class Skill < ApplicationRecord
  belongs_to :skillable, polymorphic: true

  validates_presence_of :name, :skillable_id, :skillable_type

  validates_uniqueness_of :skillable_id, scope: :skillable_type

  validates_length_of :name, maximum: 20
  validates_length_of :skillable_type, maximum: 10

  validates_inclusion_of :is_required, in: [true, false], allow_blank: true
end
