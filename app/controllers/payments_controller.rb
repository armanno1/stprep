class PaymentsController < ApplicationController
  require 'stripe'
  def create
    course = Course.find_by_id(params[:course])
    user = current_user
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      customer_email: user.email,
      client_reference_id: course.id,
      line_items: [{
        name: course.title,
        description: course.description,
        amount: 500,
        currency: 'gbp',
        quantity: 1,
      }],
      success_url: 'https://www.stprep.com/courses/',
      cancel_url: 'https://www.stprep.com/courses/',
    })
    render 'new' if !!@session.id
  end
end
