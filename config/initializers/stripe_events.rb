#Rails.configuration.stripe = {
#  :publishable_key => Rails.application.credentials.stripe[:development][:publishable_key],
#  :secret_key => Rails.application.credentials.stripe[:development][:secret_key],
#  :signing_secret => Rails.application.credentials.stripe[:development][:signing_secret]
#}

Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
StripeEvent.signing_secret = "whsec_a2i7vCLs7xGuZBQce0Suye7lF4Dq5jQL"

StripeEvent.configure do |events|
  events.all do |event|
    if event.type == "checkout.session.completed"
      user = User.find_by_email(event.data.object['customer_email'])
      course = Course.find_by_id(event.data.object['client_reference_id'])
      UserCourse.create(user: user, course: course)
    end
  end
end
