require 'rails_helper'
require 'twitter'

RSpec.describe TwitterService do
  let(:tweet_message) { "I'm tweeting with my account!" }

  context '#tweet' do
    it 'tweet a message' do
      tweet = TwitterService.send_tweet(tweet_message)
      debugger
      expect(tweet).to eq("Twitter::Tweet id=1595087860503543808")
    end
  end
end