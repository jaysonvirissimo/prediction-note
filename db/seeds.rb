def create_users(number)
  number.times do
    User.create!(username: Faker::Internet.user_name, password: 'password')
  end
end

def create_predictions(number)
  number.times do
    Prediction.create!(
      user_id: User.all.to_a.sample.id,
      statement: Faker::Lorem.sentence,
      deadline: Faker::Time.between(10.days.ago, 10.days.from_now)
    )
  end
end

def create_wagers(number)
  predictions = Prediction.all.to_a
  users = User.all.to_a

  number.times do
    Wager.create!(
      prediction_id: predictions.sample.id,
      probability: rand(100),
      user_id: users.sample.id
    )
  end
end

def create_judgments(number)
  predictions = Prediction.all.to_a
  users = User.all.to_a

  number.times do
    prediction = predictions.sample
    user = users.sample
    Judgment.create!(
      user_id: user.id,
      prediction_id: prediction.id,
      status: %w(verified falsified).sample
    )
    prediction.judged = true
    prediction.save
  end
end

def create_quotes
  Quote.create!(
    author: "Alex Tabarrok",
    quote: "A bet is a tax on bullshit."
  )

  Quote.create!(
  author: "Penn Jellete",
  quote: "Luck is statistics taken personally."
  )

  Quote.create!(
  author: "John Calvin",
  quote: "I've got to start listening to those quiet, nagging doubts."
  )

  Quote.create!(
  author: "Ken Wilber",
  quote: "Nobody is smart enough to be wrong all the time."
  )

  Quote.create!(
  author: "Voltaire",
  quote: "Doubt is not a pleasant condition, but certainty is absurd."
  )

  Quote.create!(
  author: "Warren E. Buffett",
  quote: "The Noah principle: predicting rain doesn’t count, building arks does."
  )

  Quote.create!(
  author: "George Bernard Shaw",
  quote: "It is the mark of a truly intelligent person to be moved by statistics."
  )

  Quote.create!(
  author: "Fred Mosteller",
  quote: "It’s easy to lie with statistics, but it’s easier to lie without them."
  )

  Quote.create!(
  author: "Hermann von Helmholtz",
  quote: "The most practical thing in the world is a good theory."
  )

  Quote.create!(
  author: "John Maynard Keynes",
  quote: "When the facts change, I change my mind. What do you do, sir?"
  )
end

create_users(16)
create_predictions(64)
create_wagers(128)
create_judgments(64)
create_quotes
