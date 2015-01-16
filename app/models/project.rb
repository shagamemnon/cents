class Project < ActiveRecord::Base
  has_many :investments
  belongs_to :user
  belongs_to :charity

  def self.progress_bar(projects)
    projects.each do |proj|
      unless proj.monetary_goal.nil? && proj.funded.nil?
        monetary_goal = proj.monetary_goal
        amount_funded = proj.funded.to_f
        percentage_funded = amount_funded/monetary_goal * 100
        proj.percentage_complete = percentage_funded
        proj.save!
      end
    end
  end
end
