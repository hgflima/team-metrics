class Project < ActiveRecord::Base
  has_many :backlogs, dependent: :destroy
end
