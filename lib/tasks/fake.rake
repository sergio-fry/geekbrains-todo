namespace :fake do
  desc "Fake all date"
  task all: [:users, :events]

  task events: :environment do
    Item.destroy_all
    Event.destroy_all

    User.all.each do |user|
      rand(3..5).times do
        done = FFaker::Boolean.random
        event = Event.create!(
          name: FFaker::Lorem.sentence[0..25],
          content: FFaker::Lorem.sentence,
          done: done,
          finished_at: done ? FFaker::Time.datetime : nil,
          user_id: user.id
        )

        rand(3..5).times do
          Item.create!(
            name: FFaker::Lorem.sentence[0..25],
            event_id: event.id,
            done: event.done? ? true : FFaker::Boolean.random
          )
        end
      end
    end
  end

  task users: :environment do
    User.destroy_all
    10.times do
      User.create!(
        name: FFaker::Name.name,
        email: FFaker::Internet.email,
        role_id: Role.find_by(code: 'admin').id
      )
    end
  end
end
