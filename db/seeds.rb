10.times do
  deck = Deck.new
  deck.name = Faker::Lorem.word
  deck.save!
  20.times do
    card = deck.cards.new
    word = Faker::Address.city
    card.front = 'q_' + word
    card.back = 'a_' + word
    card.created_at = Faker::Date.between(6.years.ago, 1.days.ago)
    card.updated_at = Faker::Date.between(card.created_at, Date.today)
    card.last_showed_at = Faker::Date.between(card.created_at, Date.today)
    card.save!
    print '.'
  end
end
