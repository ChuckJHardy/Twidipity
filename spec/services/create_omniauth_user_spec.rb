require "rails_helper"

describe CreateOmniauthUser do
  subject { described_class.call user: user, auth: auth }

  let(:user) { User.new }
  let(:auth) do
    {
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

  let(:user_details) do
    {
      "id" => nil,
      "uid" => "123456",
      "role" => "inactive",
      "token" => "a1b2c3d4",
      "secret" => "abcdef1234",
      "name" => "John Q Public",
      "nickname" => "johnqpublic",
      "location" => "Anytown, USA",
      "time_zone" => "Chicago",
      "lang" => "en",
      "created_at" => nil,
      "updated_at" => nil
    }
  end

  it "returns user with auth details set" do
    expect(user).to receive(:save) { true }
    expect(subject.serializable_hash).to eq(user_details)
  end
end
