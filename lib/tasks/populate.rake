namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do

    [User, Project, Investment].each(&:delete_all)

    password = "password"
    User.populate 20 do |user|
      user.first_name = Faker::Name.first_name
      user.last_name = Faker::Name.last_name
      user.image = Faker::Avatar.image("my-own-slug")
      user.email = Faker::Internet.email
      user.encrypted_password = User.new(password: password).encrypted_password
      Project.populate 1 do |project|
        project.user_id = user.id
        project.monetary_goal = [16, 18, 20]
        project.created_at = 2.years.ago..Time.now
        project.title = Populator.words(2..3).titleize
        project.short_desc = Populator.words(10..15)
        project.long_desc = Populator.sentences(4..5)
        Investment.populate 3 do |investment|
          investment.project_id = project.id
          investment.amount = [0.37, 0.78, 0.99]
          investment.duration = 5
          investment.created_at = 2.years.ago..Time.now
        end
      end
    end

    Charity.populate 10 do |charity|
      charity.name = Faker::Company.name
      charity.mission = Populator.sentences(2)
    end
  end
end
