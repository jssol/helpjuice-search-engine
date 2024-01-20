namespace :generate_searches do
  desc 'Generate 100 searches with Faker'
  task generate: :environment do
    100.times do
      Search.create(
        query: Faker::Hipster.sentence(word_count: rand(1..5)),
        ip_address: Faker::Internet.ip_v4_address
      )
    end
    puts 'Generated 100 searches!'
  end
end
