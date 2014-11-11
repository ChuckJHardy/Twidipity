# https://gist.github.com/zhengjia/428105

Given(/^I go to the homepage$/) do
  visit "/"
end

Given(/^I click on "(.*?)"$/) do |name|
  click_link name
end

Then(/^I should see "(.*?)" page title$/) do |title|
  expect(page).to have_title title
end

Then(/^I should see "(.*?)" on the page$/) do |text|
  expect(page).to have_content text
end

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

Then(/^I should be on the homepage$/) do
  expect(current_path).to eq(root_path)
end
