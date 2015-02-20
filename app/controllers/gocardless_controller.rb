class GocardlessController < ApplicationController

  def webhook
    if GoCardless.webhook_valid?(params[:payload])
      render :text => "true", :status => 200
    else
      render :text => "false", :status => 403
    end
  end
  def confirm
    GoCardless.confirm_resource params
    render "gocardless/success"
  rescue GoCardless::ApiError => e
    render :text => "Could not confirm new subscription. Details: #{e}"
  end
  def submit
    # We'll be billing everyone £10 per month in this example
    url_params = {
      :amount          => 10,
      :interval_unit   => "month",
      :interval_length => 1,
      :name            => "Premium Subscription",
      # Set the user email from the submitted value
      :user => {
        :email => params["email"]
      }
    }
    url = GoCardless.new_subscription_url(url_params)
    redirect_to url
  end
end

