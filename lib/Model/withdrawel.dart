class WithdrawelDetails {
  final int w_id;
  final int amount;
  final DateTime date;
  final String status;
  final int user_id;

  WithdrawelDetails(
      {required this.w_id,
      required this.amount,
      required this.date,
      required this.status,
      required this.user_id});
}
