def create_users(number)
  number.times do
    User.create!(username: Faker::Internet.user_name, password: "password")
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

create_users(5)
create_predictions(25)
create_wagers(125)
