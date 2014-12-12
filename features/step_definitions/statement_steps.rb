Then(/^I should have a new Statement Record with a "(.*?)" status$/) do |status|
  expect(Statement.last.status).to eq(status)
end

Then(/^I should see a Feedback link$/) do
  href = 'http://goo.gl/forms/SvqMq3h9SL'
  expect(page).to have_selector "a[href='#{href}']", text: 'Feedback'
end

Then(/^I should see a Feature Requests link$/) do
  href = 'http://goo.gl/forms/htXTjYioot'
  expect(page).to have_selector "a[href='#{href}']", text: 'Feature Requests'
end
