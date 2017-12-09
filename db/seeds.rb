
30.times do |i|
  card = Card.new
  card.front = Faker::Lorem.sentence
  card.back = Faker::Lorem.sentence
  card.created = Faker::Date.between(10.years.ago, 1.days.ago)
  card.updated = Faker::Date.between(card.created, Date.today)
  card.showed = 1 + rand(20)
  card.corect = 1 + rand(20)
  card.last_showed = Faker::Date.between(card.created, Date.today)
  card.save!
  print '.'
end
