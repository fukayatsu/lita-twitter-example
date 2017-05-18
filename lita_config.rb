Lita.configure do |config|
  config.robot.name       = 'lita'
  config.robot.adapter    = 'twitter'
  config.robot.log_level  = :info

  config.redis[:url] = 'redis://localhost:6379/0'
  config.http.port   = 8080

  config.adapters.twitter.api_key             = ENV['API_KEY']
  config.adapters.twitter.api_secret          = ENV['API_SECRET']
  config.adapters.twitter.access_token        = ENV['ACCESS_TOKEN']
  config.adapters.twitter.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end

module Lita
  module Handlers
    class HelloHandler < Handler
      route /hi/i, :hello, command: false
      def hello(response)
        response.reply 'Hello!'
      end
    end
    Lita.register_handler(HelloHandler)
  end
end
