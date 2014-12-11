Then(/^I should see a Twitter Share link$/) do
  href = 'https://twitter.com/intent/tweet?original_referer=' \
    'http://www.example.com/&status=Join%20@Twidipity%20in%20' \
    'the%20discovery%20of%20Twitter http://www.example.com/'

  expect(page).to have_selector "a[href='#{href}']", text: 'share'
end
