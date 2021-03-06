class ChargesController < ApplicationController
  @amount = 15_00

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Blocpedia Premium Membership - #{current_user.username}",
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
      description: "Blocpedia Premium Account for: #{current_user.username}",
      currency: 'usd'
    )

    # Upgrades the current_user to Premium
    current_user.premium!

    flash[:notice] = "Thanks for supporting Blocpedia, #{current_user.username}! Your account has been upgraded to Premium. If you have any questions please email admin@designxdevelop.com."
    # does't matter where we redirect this -- Use the User Path
    redirect_to wikis_path  #user_path(current_user)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

  def downgrade
    current_user.standard!
    current_user.wikis.update_all(private: false)
    #current_user.wikis.private = false
    #@downgrade_wikis = Wiki.current_user.all
    # ^^^ I don't think these work because my charges controller won't have access to the Wiki's methods...
    redirect_to wikis_path # eventually redirect back to User Profile (TBAL)
    flash[:notice] = "Your account has been downgraded back to a Standard Account. All previously private wikis are now public."
  end
end
