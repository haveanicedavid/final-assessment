class Task < ActiveRecord::Base

  validates :title      , presence: true
  validates :start_date , presence: true
  validates :due_date   , presence: true

  validate :check_start_date, :check_due_date
  belongs_to :list

  enum status: %w(Incomplete Complete)

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  def check_start_date
    if self.start_date && self.start_date < Time.now
      errors.add(:start_date, "cannot be in the past")
    end
  end

  def check_due_date
    if self.due_date && self.due_date < Time.now
      errors.add(:due_date, "cannot be in the past")
    end
  end

end
