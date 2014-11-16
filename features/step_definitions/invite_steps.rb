Given(/^I complete and submit a valid email$/) do
  VCR.use_cassette("services/subscribe_to_mail_chimp/success") do
    fill_in("address", with: "twidipity+test@insert.coffee")
    click_button("Save")
  end
end

Given(/^I complete and submit an invalid email$/) do
  VCR.use_cassette("services/subscribe_to_mail_chimp/failure") do
    fill_in("address", with: "twidipity@")
    click_button("Save")
  end
end

Given(/^I complete and submit a valid twitter handle$/) do
  fill_in("address", with: "@twidipity")
  click_button("Save")
end
