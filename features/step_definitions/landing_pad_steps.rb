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

Then(/^I should be on Twitter Share page$/) do
  raise current_url.inspect
end

Then(/^I should see a Twitter Share link$/) do
  href = "https://twitter.com/intent/tweet?original_referer=http://www.example.com/&status=The%20discovery%20of%20fortunate%20Twitter%20events%20by%20accident%20with%20@Twidipity http://www.example.com/"
  expect(page).to have_selector "a[href='#{href}']", text: "Share"
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
