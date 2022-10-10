class ApplicationController < ActionController::Base
  before_action :setup

  private

  def setup
    @client = IEX::Api::Client.new(
      publishable_token: ENV['PUBLISHABLE'],
      secret_token: ENV['SECRET'],
      endpoint: ENV['ENDPOINT']
    )
  end
end
