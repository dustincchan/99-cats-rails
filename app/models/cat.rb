class Cat < ActiveRecord::Base
  COLORS = %w(white black grey orange teal yellow)
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: COLORS }
  validates :sex, length: { is: 1 }, inclusion: { in: %w(M F) }

  has_many :cat_rental_requests,
    dependent: :destroy,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: "CatRentalRequest"
end
