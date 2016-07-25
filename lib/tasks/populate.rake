namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'

    [User, Nanny, Info, Schedule, Parent, Child, Case, Rating, Item].each(&:delete_all)


    def create_user()
      User.create( :email => Faker::Internet.email,
                   :password => Faker::Internet.password(8) )
    end

    def create_parent(user, years=100)
      Parent.create( :user_id => user.id,
                     :last_name => Faker::Name.last_name,
                     :first_name => Faker::Name.first_name,
                     :nickname => Faker::Name.title,
                     :gender => rand(0..1) == 0 ? 'male' : 'female',
                     :phone => Faker::PhoneNumber.phone_number,
                     :birthdate => Faker::Date.between((365 * years).days.ago, Date.today),
                     :city => city(),
                     :district => random_district() )
    end

    def create_nanny(user, years=80)
      Nanny.create( :user_id => user.id,
                    :last_name => Faker::Name.last_name,
                    :first_name => Faker::Name.first_name,
                    :nickname => Faker::Name.title,
                    :gender => rand(0..3) == 0 ? 'male' : 'female',
                    :phone => Faker::PhoneNumber.phone_number,
                    :birthdate => Faker::Date.between((365 * years).days.ago, Date.today),
                    :city => city(),
                    :district => random_district() )
    end

    def create_cases(num_of_times, parent_id, nanny_id)
      index = 0
      schedule_id = Schedule.first.id
      # the five qualities the the ratings are based on
      item_qualities = ['Friendliness', 'Conscientiousness', 'Hotness', 'Dependability', 'Trustworthiness']
      while index < num_of_times
        a_case = Case.create( :parent_id => parent_id[index],
                              :nanny_id => nanny_id[index] )
        schedule_case_id = Schedule.find(schedule_id).update( :case_id => a_case.id,
                                                              :text => Faker::Beer.name )
        if index % 2 == 0
          rating = Rating.create( :case_id => a_case.id,
                                  :rater_id => parent_id[index],
                                  :rated_id => nanny_id[index],
                                  :feedback => Faker::Hipster.sentence )
        else
          rating = Rating.create( :case_id => a_case.id,
                                  :rater_id => parent_id[index],
                                  :rated_id => nanny_id[index],
                                  :feedback => Faker::Hipster.sentence )
        end
        item_qualities.each do |quality|
          item = Item.create( :rating_id => rating.id,
                              :name => quality,
                              :scored => rand(1..5))
        end
        schedule_id += 1
        index += 1
      end
    end

    def city()
      cities = [:台北市]
      cities = cities.map  { |x| x.to_s }
      city = cities[rand(0...cities.count)]
    end

    def random_district()
      districts = [:松山區,:信義區,:大安區,:中山區,:中正區,:大同區,:內湖區,:士林區,:北投區,:萬華區,:文山區,:南港區]
      districts = districts.map { |x| x.to_s }
      district = districts[rand(0...districts.count)]
    end


    puts 'Populating db with fake data:)'


    parent_users = []
    child_users = []
    nanny_users = []


    10.times do
      user = create_user()
      parent = create_parent(user)

      parent_users.push(parent.id)

      2.times do
        child = Child.create(:parent_id => parent.id)
        child_users.push(child.id)
      end
    end

    10.times do
      user = create_user()
      nanny = create_nanny(user)

      nanny_users.push(nanny.id)

      charge = Faker::Commerce.price.to_i
      info = Info.create(:nanny_id => nanny.id,
                         :weekday_charge => (charge * 5),
                         :holiday_charge => (charge * 7),
                         :special_charge => (charge * 8),
                         :introduction => Faker::Lorem.sentence,
                         :case_done => nanny.cases.count )
      2.times do
        schedule = Schedule.create(:nanny_id => nanny.id)
      end
    end

    p parent_users
    p child_users
    p nanny_users

    create_cases(7, parent_users, nanny_users)




  end
end


