$(document).ready(function() {
  var input = $(".amount-input");
  var amountImpact = $(".amount-impact");
  input.on('keypress', function(event) {
      var amount = "<h1>" + this.val() + "</h1>";
      amountImpact.append(amount);
  });
});
