require 'twitter'

TWITTER_CLIENT = Twitter::REST::Client.new do |config|
                  config.consumer_key = 'slmLB86di1vEn5zl2bbMt4BiG'
                  config.consumer_secret = 'hdKSRVrcguXVkaUbnKC0nlh0QKvaTv21RUdcgsC5d6quvwYBOo'
                  config.oauth_token = '94298024-6HVxrjPLacZe7rxdr1rYEeXgvJJZ1rollMx4b5x5y'
                  config.oauth_token_secret = 'TKLf95PEQaHG3USiuP3fP1noQhmQUAI0Vp8XHjw0fUcX3'
                end

TWITTER_STREAM_CLIENT = Twitter::Streaming::Client.new do |config|
                            config.consumer_key = 'slmLB86di1vEn5zl2bbMt4BiG'
                            config.consumer_secret = 'hdKSRVrcguXVkaUbnKC0nlh0QKvaTv21RUdcgsC5d6quvwYBOo'
                            config.oauth_token = '94298024-6HVxrjPLacZe7rxdr1rYEeXgvJJZ1rollMx4b5x5y'
                            config.oauth_token_secret = 'TKLf95PEQaHG3USiuP3fP1noQhmQUAI0Vp8XHjw0fUcX3'
                        end