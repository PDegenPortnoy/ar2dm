namespace :dm do
   task :migrate => :environment do
     gem "dm-migrations"
     require "migration_runner"
     Dir[File.join(Rails.root, "db", "migrate", "*")].each {|f| require f}
     migrate_up!
   end
 end

