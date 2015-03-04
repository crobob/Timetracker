class Work < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  validates :hours, numericality: { only_integer: true, greater_than: 0, less_that_or_equal_to: 8}
  validates :user, presence: true
  validates :project, presence: true
  validates :datetimeperformed, presence: true
  validate :datetimeperformed_cannot_be_future
  
  scope :fullday, -> { where("hours >= 8") }
  #scope :recent, -> { where("datetimeperformed > '#{Time.now - 7.days}'")}

  def self.recentdays(numdaysago)
    since_date = Time.now - numdaysago.to_i.days
    where("datetimeperformed > '#{since_date}'")
  end

  def datetimeperformed_cannot_be_future
    if datetimeperformed.present? && datetimeperformed > Time.now
      errors.add(:datetimeperformed, "can't be in the future")
    end
  end
  
  def to_s
    "#{user}: #{datetimeperformed.strftime('%m/%d/%Y %H:%M')} - #{hours} hours"
  end
end
