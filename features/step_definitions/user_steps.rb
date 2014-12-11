Given(/^I am a signed in user$/) do
  step 'I go to the homepage'
  step 'I click on \'Join\''
end

Then(/^I should be on the statement page$/) do
  expect(current_path).to eq(root_path)
  step 'I should see \'Follow\' submit link on the page'
end

Then(/^I should be on the landing page$/) do
  expect(current_path).to eq(root_path)
  step 'I should see \'Join\' on the page'
end
