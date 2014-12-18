namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do

    [User, Project, Investment].each(&:delete_all)

    password = "password"
    User.populate 100 do |user|
      user.first_name = Faker::Name.first_name
      user.last_name = Faker::Name.last_name
      user.image = Faker::Avatar.image("my-own-slug")
      user.email = Faker::Internet.email
      user.encrypted_password = User.new(password: password).encrypted_password
      Project.populate 20 do |project|
        project.user_id = user.id
        project.title = Populator.words(2..4).titleize
        project.short_desc = Populator.words(10..15)
        project.long_desc = Populator.sentences(4..5)
        Investment.populate 5..10 do |investment|
          investment.project_id = project.id
          investment.amount = [0.37, 0.78, 0.99]
          investment.duration = 5
          investment.created_at = 2.years.ago..Time.now
        end
      end
    end
  end
end
