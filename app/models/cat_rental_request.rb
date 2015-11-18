class CatRentalRequest < ActiveRecord::Base
  STATUSES = %w(PENDING APPROVED DENIED)
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: STATUSES }
  validate :overlapping_approved_requests

  belongs_to :cat,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: "Cat"


  def overlapping_requests
    CatRentalRequest.where(cat_id: self.cat_id).where("id != ?", self.id).
      where(<<-SQL, self.start_date, self.end_date, self.start_date, self.end_date)
        start_date BETWEEN ? AND ?
        OR
        end_date BETWEEN ? AND ?
      SQL
  end

  def overlapping_approved_requests
    if overlapping_requests.where("status = 'APPROVED'")
      errors[:requests] << "cannot overlap requests"
    end
  end
end
