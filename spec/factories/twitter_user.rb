FactoryGirl.define do
  factory :mock_twitter_user do
    sequence(:id, 260_000)
    name 'Joe Blogs'
    screen_name 'JoeBlogs'
    profile_image_uri 'http://placehold.it/56x56'
    uri 'http://www.twitter.com/JoeBlogs'
  end
end
