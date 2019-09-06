var stripe = Stripe('pk_test_qfH2BOWhxkEXfcL99c6RhRR300QJqMIBMZ');
var session_id = "<%= @session.id %>"

$(window).on('load',function(){
  document.write('hi');
  stripe.redirectToCheckout ({
    sessionId: session_id
    }).then(function (result) {
  document.write(result.error.message)
  });
})
