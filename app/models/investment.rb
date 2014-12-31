class Investment < ActiveRecord::Base
  belongs_to :projects

  def self.first_investment(project, investment)
    total = project.funded.to_f + investment
    project.update(funded: total)
  end

  def self.recurring_investment
    inv_amounts = Investment.all.map do |investment|
      investment.amount.to_f
    end
    project_ids = Investment.all.map do |investment|
      investment.project_id
    end
    project_ids.each_with_index do |id, index|
      project = Project.find(id)
      total = project.funded.to_f + inv_amounts[index]
      project.update(funded: total)
    end
  end
end
