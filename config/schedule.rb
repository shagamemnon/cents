set :output, "#{path}/log/cron.log"
set :environment, 'development'

every 15.minutes do
  runner 'Investment.recurring_investment'
end
