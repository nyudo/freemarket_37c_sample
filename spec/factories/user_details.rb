 FactoryGirl.define do

  factory :user_detail do
      family_name             "nick"
      first_name              "name"
      kana_family_name        "ニック"
      kana_first_name         "ネーム"
      birthday                "20181012"
      prefecture              "東京都" #"東京都, 13"
      city                    "渋谷区"
      address                 "111"
      residential_name        "渋谷ビル"
      phone_number            "09012345678"
      postal_code             "3631111"
      profile                 "こんにちは"
      user_image              "hogehoge.png"
  end
end
