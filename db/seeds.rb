
30.times do |i|
  card = Card.new
  card.front = Faker::Lorem.sentence
  card.back = Faker::Lorem.sentence
  card.created_at = Faker::Date.between(6.years.ago, 1.days.ago)
  card.updated_at = Faker::Date.between(card.created_at, Date.today)
  card.showed = 1 + rand(20)
  card.correct = 1 + rand(20)
  card.last_showed_at = Faker::Date.between(card.created_at, Date.today)
  card.save!
  print '.'
end
