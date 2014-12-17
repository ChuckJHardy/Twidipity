FactoryGirl.define do
  factory :suggestion do
    sequence(:tuid, 260_000)
    name 'Joe Blogs'
    description 'Some Description'
    screen_name 'JoeBlogs'
    profile_image_uri 'http://placehold.it/56x56'
    uri 'http://www.twitter.com/JoeBlogs'
  end
end
