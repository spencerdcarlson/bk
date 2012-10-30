FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  
  factory :user do
    email FactoryGirl.generate :email
    password 'secret'
    zip_code 85203
    is_admin false
  end
  
  factory :admin do
    email FactoryGirl.generate :email
    password 'secret'
    zip_code 85203
    is_admin true
  end

  factory :activity do
    name  'Mountain Biking'
  end
  
  factory :interest do
    user_rating 10
  end
    
  

end