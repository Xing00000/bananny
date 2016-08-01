namespace :db do
  desc "create ratings to bump up number of ratings and fabricate feedback"
  task :rating => :environment do

    puts 'fake ratings make things fake shit real:)'

    def fake_rating(num, case_id, parent_id, nanny_id, last_name)
      nanny = Nanny.find(nanny_id)

      num.times do

        Rating.create(case_id: case_id,
                      rater_id: parent_id,
                      rated_id: nanny_id,
                      feedback: "\"#{last_name}保姆細心照顧寶寶，讓身為媽媽的我可以很安心的衝刺工作。\"")
      end
    end

    fake_rating(14, 15, 45, 48, '宋')

  end
end