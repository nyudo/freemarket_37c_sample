FactoryGirl.define do
  factory :image do
    id 1
    image { File.open("spec/sample_image/sample1.jpg") }
    item
  end
end
