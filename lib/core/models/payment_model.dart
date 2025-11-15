class PaymentDetails {
  String paymentNumber;
  String? bankName;
  String? bankAccountNumber;

  PaymentDetails({
    required this.paymentNumber,
    this.bankName,
    this.bankAccountNumber,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) {
    return PaymentDetails(
      paymentNumber: json['payment_number'],
      bankName: json['bank_name'],
      bankAccountNumber: json['bank_account_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payment_number': paymentNumber,
      'bank_name': bankName,
      'bank_account_number': bankAccountNumber,
    };
  }
}
