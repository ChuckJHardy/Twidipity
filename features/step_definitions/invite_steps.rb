Given(/^I complete and submit a valid subscription form$/) do
  VCR.use_cassette("services/subscribe_to_mail_chimp/success") do
    fill_in("email", with: "twidipity+test@insert.coffee")
    click_button("Send")
  end
end

Given(/^I complete and submit an invalid subscription form$/) do
  VCR.use_cassette("services/subscribe_to_mail_chimp/failure") do
    fill_in("email", with: "invalid_email_address")
    click_button("Send")
  end
end
