module HomeHelper
  def self.get_tweets(search_params, opts = {result_type: "recent"})
    TWITTER_CLIENT.search(search_params, opts).map{ |tweet| {:user => tweet.user, :count => tweet.user.followers_count, :favorite_count => tweet.favorite_count, :retweet_count => tweet.retweet_count, :id => tweet.id, :text => tweet.text}}
  end

  def tweet(str)
    TWITTER_CLIENT.update(str)
  end

  def get_live_tweets(topics = ['housing', 'bangalore'], opts = {result_type: "recent"})
    tweets = TWITTER_CLIENT.search(topics.join(" "), opts).take(20).map{ |tweet| {:user => tweet.user, :followers_count => tweet.user.followers_count, :favorite_count => tweet.favorite_count, :retweet_count => tweet.retweet_count, :id => tweet.id, :text => tweet.text}}
  end

  def get_live_tweets_for_property(topics = ['housing', 'bangalore'], opts = {result_type: "recent"}, property_id=1)
    property_tags = Property.find_by_id(property_id).tag_list
    tweets = TWITTER_CLIENT.search(topics.join(" "), opts).take(20).map{ |tweet| {:user => tweet.user, :followers_count => tweet.user.followers_count, :favorite_count => tweet.favorite_count, :retweet_count => tweet.retweet_count, :id => tweet.id, :text => tweet.text}}
    tweets_with_rating = []
    tweets.each { |tweet|
      if (property_tags.any? { |word| tweet.include?(word) })
        tweet.merge!({:related_to_property => true})
      else
        tweet.merge!({:related_to_property => false})
      end
      rating = calculate_tweet_rating(tweet)
      tweets_with_rating << tweet.merge!({:rating => rating})
    }
    tweets_with_rating
  end

  def calculate_tweet_rating(tweet)
    rating = 0
    user = tweet[:user]
    account_verified = user.verified
    followers_count = tweet[:followers_count]
    retweet_count = tweet[:retweet_count]
    favorite_count = tweet[:favorite_count]
    return 5 if account_verified

    if followers_count <= 5000
      rating += (followers_count*3)/5000
    else
      rating += (followers_count*6)/30000
    end

    if retweet_count <= 5000
      rating += (retweet_count*3)/5
    else
      rating += (retweet_count*6)/15
    end

    if retweet_count <= 5000
      rating += (favorite_count*3)/1
    else
      rating += (favorite_count*6)/5
    end
    rating += 4
    (rating/4).to_i
  end

end
