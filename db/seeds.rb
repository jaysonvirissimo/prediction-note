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
    author: 'Alex Tabarrok',
    quote: 'A bet is a tax on bullshit.'
  )

  Quote.create!(
    author: 'Penn Jellete',
    quote: 'Luck is statistics taken personally.'
  )

  Quote.create!(
    author: 'Ken Wilber',
    quote: 'Nobody is smart enough to be wrong all the time.'
  )

  Quote.create!(
    author: 'Voltaire',
    quote: 'Doubt is not a pleasant condition, but certainty is absurd.'
  )

  Quote.create!(
    author: 'Warren E. Buffett',
    quote: 'The Noah principle: predicting rain doesn’t count, building arks does.'
  )

  Quote.create!(
    author: 'George Bernard Shaw',
    quote: 'It is the mark of a truly intelligent person to be moved by statistics.'
  )

  Quote.create!(
    author: 'Fred Mosteller',
    quote: 'It’s easy to lie with statistics, but it’s easier to lie without them.'
  )

  Quote.create!(
    author: 'Hermann von Helmholtz',
    quote: 'The most practical thing in the world is a good theory.'
  )

  Quote.create!(
    author: 'John Maynard Keynes',
    quote: 'When the facts change, I change my mind. What do you do, sir?'
  )

  Quote.create!(
    author: 'Charles S. Peirce',
    quote: 'It is easy to be certain. One has only to be sufficiently vague.'
  )

  Quote.create!(
    author: 'John Von Neumann',
    quote: 'Truth is much too complicated to allow anything but approximations.'
  )

  Quote.create!(
    author: 'Ran Prieur',
    quote: "There is one rule that's very simple, but not easy: observe reality and adjust."
  )

  Quote.create!(
    author: 'Jason Roy',
    quote: "Shouldn't 'it works like a charm' be said about things that don't work?"
  )

  Quote.create!(
    author: 'Mark Twain',
    quote: 'We should be careful to get out of an experience only the wisdom that is in it.'
  )

  Quote.create!(
    author: 'Democritus',
    quote: "It is better to destroy one's own errors than those of others."
  )

  Quote.create!(
    author: 'Alexander Philip Dawid',
    quote: 'Statistics is applied philosophy of science.'
  )

  Quote.create!(
    author: 'Thomas Sowell',
    quote: 'Reality is not optional.'
  )

  Quote.create!(
    author: 'H.L. Mencken',
    quote: 'Truth would quickly cease to be stranger than fiction, once we got as used to it.'
  )

  Quote.create!(
    author: 'Robert A. Heinlein',
    quote: 'Being right too soon is socially unacceptable.'
  )

  Quote.create!(
    author: 'Daniel Kahneman',
    quote: 'Mind is a machine for jumping to conclusions.'
  )
end

def create_guest_user
  User.create!(username: 'Guest', password: 'password')
end

create_users(16)
create_guest_user # warning: guest login won't work without this
create_predictions(64)
create_wagers(256)
create_judgments(64)
create_quotes
