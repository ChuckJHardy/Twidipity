Then(/^I should see a Twitter Share link$/) do
  href = 'https://twitter.com/intent/tweet?original_referer=' \
         'http://www.example.com/&status=The%20discovery%20of%20fortunate%20' \
         'Twitter%20events%20by%20accident%20with%20@Twidipity http://www.example.com/'

  expect(page).to have_selector "a[href='#{href}']", text: 'Share'
end
