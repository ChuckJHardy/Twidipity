When(/^I input "(.*?)" as my Twitter Handle$/) do |name|
  fill_in("handle", with: name)
end
