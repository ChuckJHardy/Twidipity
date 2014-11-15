Before('@omniauth_test') do
  OmniAuth.config.test_mode = true

  # the symbol passed to mock_auth is the same as the name of the provider set up in the initializer
  OmniAuth.config.mock_auth[:twitter] = {
    uid: "123456",
    info: {
      nickname: "johnqpublic",
      name: "John Q Public",
      location: "Anytown, USA",
    },
    credentials: {
      token: "a1b2c3d4",
      secret: "abcdef1234"
    },
    extra: {
      raw_info: {
        lang: "en",
        time_zone: "Chicago"
      }
    }
  }
end

After('@omniauth_test') do
  OmniAuth.config.test_mode = false
end
