namespace :fake do
  desc "Fake all date"
  task all: %i[users events tags]

  task events: :environment do
    Item.destroy_all
    Event.destroy_all

    User.all.each do |user|
      print "."
      rand(3..5).times do
        done = FFaker::Boolean.random
        event = user.events.create!(
          name: FFaker::Lorem.sentence[0..25],
          content: FFaker::Lorem.sentence,
          done:,
          finished_at: done ? FFaker::Time.datetime : nil
        )

        rand(3..5).times do
          event.items.create!(
            name: FFaker::Lorem.sentence[0..25],
            done: event.done? ? true : FFaker::Boolean.random
          )
        end
      end
    end
  end

  task tags: :environment do
    Tag.destroy_all

    10.times do
      Tag.create! name: FFaker::Name.first_name
    end
  end

  task users: :environment do
    User.destroy_all
    roles = Role.all.to_a

    ENV.fetch("COUNT", "10").to_i.times do
      roles.sample.users.create!(
        name: FFaker::Name.name,
        email: FFaker::Internet.email,
        password: "secret123",
        state: :active
      )
    end
  end
end
