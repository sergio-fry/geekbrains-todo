namespace :transactions do
  desc "test transaction"
  task test: :environment do
    ApplicationRecord.transaction do
      User.create!(
        name: FFaker::Name.name,
        email: FFaker::Internet.email,
        role_id: Role.find_by(code: "admin").id
      )

      # 10 / 0

      User.create!(
        name: FFaker::Name.name,
        email: FFaker::Internet.email,
        role_id: Role.find_by(code: "admin").id
      )
    end
  end
end
