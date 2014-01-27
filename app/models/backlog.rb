class Backlog < ActiveRecord::Base
  belongs_to :project

  # Ordenar os backlogs na base de dados, seguindo a ordem da lista backlog_ids
  def self.sort(backlog_ids)

    position = 0

    backlog_ids.each do |id|
      b = Backlog.find id
      b.update_attribute(:position, position)
      position = position + 1
    end

  end

end
