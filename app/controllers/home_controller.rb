class HomeController < ApplicationController

  def index
    webhook = BuildWebhookService.new(current_user, cookie_webhook_token).find_or_create!
    set_cookie_webhook_token(webhook.webhook_token)
    redirect_to webhook_path(webhook.uuid)
  end

  private
end
