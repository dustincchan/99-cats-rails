class CatRentalRequest < ActiveRecord::Base
  STATUSES = %w(PENDING APPROVED DENIED)
  validates :cat_id, :status, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: STATUES }
  validate overlapping_requests

  belongs_to :cat,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: "Cat"

  private

  def overlapping_requests

  end

  def overlapping_approved_requests
end
