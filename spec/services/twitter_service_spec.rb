require 'rails_helper'
require 'twitter'

RSpec.describe TwitterService do
  let(:tweet_message) { "I'm tweeting with my account!" }

  context '#tweet' do
    it 'tweet a message' do
      tweet = TwitterService.send_tweet(tweet_message)
      
      expect(tweet).to be_an_instance_of(Twitter::Tweet)
    end
  end
end