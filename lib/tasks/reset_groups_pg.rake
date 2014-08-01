desc "Reset Group Table, and sets all members' group_id to null"
task :reset_groups_pg => :environment do
  Member.update_all(group_id: nil)
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE groups RESTART IDENTITY;")
end