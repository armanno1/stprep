module Stripe
  class InvoiceEventHandler
    def call(event)
      begin
        method = "handle_" + event.type.tr('.', '_')
        self.send method, event
      rescue JSON::ParserError => e
        render json: {:status => 400, :error => "Invalid payload"}
        return
      rescue NoMethodError => e
      end
    end

    def handle_checkout_session_completed(event)
      user = User.find_by_email(event.data.object['customer_email'])
      user.courses = Course.find_by_id(event.data.object['client_reference_id'])
      user.save
    end

  end
end
