 FactoryGirl.define do

   factory :user do
      id                      "1"
      nickname                "NICK"
      email           "nickname@example.com"
      password                "nickname"
      password_confirmation   "nickname"

      user_detail
   end

end
