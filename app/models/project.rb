class Project < ActiveRecord::Base
  has_many :backlogs, -> { order "position ASC" }, dependent: :destroy

  def get_last_backlog_position
    backlogs.maximum(:position)
  end

end
