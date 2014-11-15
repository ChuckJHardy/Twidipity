Given(/^I go to the new invite page$/) do
  visit "/invite/new"
end

Given(/^I am a signed in user$/) do
  step "I go to the new invite page"
  step "I click on \"Signin\" and callback"
end

Given(/^I click on "(.*?)" and callback$/) do |name|
  step "I click on \"#{name}\""
end

Then(/^I should be on the statement page$/) do
  expect(current_path).to eq(root_path)
  step "I should see \"Start\" on the page"
end

Then(/^I should be on the invite page$/) do
  expect(current_path).to eq(root_path)
  step "I should see \"Request Invite\" on the page"
end
