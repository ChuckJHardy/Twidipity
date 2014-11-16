require "rails_helper"

describe SubscribeWithTwitter do
  subject { described_class.call address: handle, controller: controller }

  let(:controller) { double("TestController", root_path: "/") }
  let(:handle) { "@twidipity" }

  it "redirects" do
    expect(controller).to receive(:redirect_to).
      with("/auth/twitter")

    subject
  end
end
