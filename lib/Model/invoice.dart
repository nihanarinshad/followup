
class InvoiceDetails {
  final int iv_id;
  final int amount;
  final String packageName;
  final DateTime date;
  final int userid;
  final String userName;

  InvoiceDetails({
    required this.packageName,
    required this.date,
    required this.userid,
    required this.userName,
    required this.amount,
    required this.iv_id,
  });
}
