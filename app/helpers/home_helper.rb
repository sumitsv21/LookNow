module HomeHelper
  def self.get_tweets(search_params, opts = {result_type: "recent"})
    TWITTER_CLIENT.search(search_params, opts).map{ |tweet| {:user => tweet.user, :count => tweet.user.followers_count, :favorite_count => tweet.favorite_count, :retweet_count => tweet.retweet_count, :id => tweet.id, :text => tweet.text}}
  end

  def tweet(str)
    TWITTER_CLIENT.update(str)
  end

  def get_live_tweets(topics = ['housing', 'bangalore'], opts = {result_type: "recent"})
    TWITTER_CLIENT.search(topics.join(" "), opts).map{ |tweet| {:user => tweet.user, :count => tweet.user.followers_count, :favorite_count => tweet.favorite_count, :retweet_count => tweet.retweet_count, :id => tweet.id, :text => tweet.text}}
  end
end
