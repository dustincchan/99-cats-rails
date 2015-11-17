class Cat < ActiveRecord::Base
  COLORS = %w(white black grey orange teal yellow)
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: COLORS }
  validates :sex, length: { is: 1 }, inclusion: { in: %w(M F) }
end
