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

Then(/^I should be on the homepage$/) do
  expect(current_path).to eq(root_path)
end
