class ChargesController < ApplicationController
  @amount = 15_00

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Blocpedia Premium Membership - #{current_user.user_name}",
      amount: @amount
     }
  end

  def create
    # The amount in pennies we will be charging the User
    @amount = 15_00

    # Creates a stripe Customer object to connect to the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    # Where the actual stripe charge is happening
    charge = Stripe::Charge.create(
      customer: customer.id, # not the user_id this is a stripe specific customer id number
      amount: @amount,
      description: "Blocpedia Premium Account for: #{current_user.user_name}",
      currency: 'usd'
    )

    # Upgrades the current_user to Premium
    current_user.premium!

    flash[:notice] = "Thanks for supporting Blocpedia, #{current_user.user_name}! Your account has been upgraded to Premium. If you have any questions please email admin@designxdevelop.com."
    redirect_to user_path(current_user) # does't matter where we redirect this

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end
end
