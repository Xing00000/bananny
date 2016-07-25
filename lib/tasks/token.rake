namespace :dev do
  task :generate_user_token => :environment do
    User.find_each do |u|
      puts "Generating #{u.id} #{'token'.pluralize(User.count)}"
      u.generate_authentication_token
      u.save!
    end
  end
end