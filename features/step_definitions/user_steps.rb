Given(/^I go to the new invite page$/) do
  visit '/invite/new'
end

Given(/^I am a signed in user$/) do
  step 'I go to the new invite page'
  step 'I click on \'Signin\' as an Admin'
end

Then(/^I should be on the statement page$/) do
  expect(current_path).to eq(root_path)
  step 'I should see \'Start\' button on the page'
end

Then(/^I should be on the invite page$/) do
  expect(current_path).to eq(root_path)
  step 'I should see \':)\' on the page'
end

When(/^I click on '(.*?)' as an Admin$/) do |name|
  allow_any_instance_of(User).to receive(:inactive?) { false }
  step "I click on '#{name}'"
end
