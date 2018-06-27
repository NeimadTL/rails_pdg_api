class Shift < ApplicationRecord

  validates :start_date, presence: true

  belongs_to :worker, :foreign_key => :worker_id, class_name: 'Worker', optional: true

  def on_weekend?
    self.start_date.saturday? || self.start_date.sunday?
  end

end
