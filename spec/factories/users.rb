 FactoryGirl.define do

   factory :user do
      id                      "1"
      nickname                "NICK"
      # family_name             "nick"
      # first_name              "name"
      # kana_family_name        "ニック"
      # kana_first_name         "ネーム"
      email           "nickname@example.com"
      password                "nickname"
      # birthday                "2018/10/12"
      # prefecture              "東京都"
      # city                    "渋谷区"
      # address                 "111"
      # residential_name        "渋谷ビル"
      # phone_number            "909111"
      # postal_code             "3631111"
      # profile                 "こんにちは"
   end

end
