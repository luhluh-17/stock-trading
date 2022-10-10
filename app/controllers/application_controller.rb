class ApplicationController < ActionController::Base
  before_action :setup

  def after_sign_in_path_for(resource)
    if current_user.role == 'admin'
      admin_index_path
    else
      root_path
    end
  end

  private

  def setup
    @client = IEX::Api::Client.new(
      publishable_token: ENV['PUBLISHABLE'],
      secret_token: ENV['SECRET'],
      endpoint: ENV['ENDPOINT']
    )
  end
end
