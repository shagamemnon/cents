class Investment < ActiveRecord::Base
  belongs_to :project
  has_one :user, through: :project

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
      funding_diff = project.monetary_goal - project.funded
      if funding_diff < 0.99
        total = project.funded.to_f + funding_diff
        project.update(funded: total, completed: true)
      else
        total = project.funded.to_f + inv_amounts[index]
        project.update(funded: total)
      end
    end
  end
end
