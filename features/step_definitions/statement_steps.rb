Then(/^I should have a new Statement Record with a "(.*?)" status$/) do |status|
  expect(Statement.last.status).to eq(status)
end
