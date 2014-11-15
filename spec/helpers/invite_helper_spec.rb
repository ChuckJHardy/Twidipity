require 'rails_helper'

RSpec.describe InviteHelper, type: :helper do
  describe "#signin_link" do
    subject { helper.signin_link }

    it "returns expected link" do
      expect(subject).to eq %q(<a href="/auth/twitter">Signin</a>)
    end

    context "when `user_id` session exists" do
      before { session[:user_id] = 1 }

      it "returns expected text" do
        expect(subject).to eq("10/01/2015")
      end

      after { session[:user_id] = nil }
    end
  end
end
