import 'dart:convert';
import 'dart:io';

import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/customer_form.dart';
import 'package:follow_up/Model/history.dart';
import 'package:follow_up/Model/invoice.dart';
import 'package:follow_up/Model/moderator_details.dart';
import 'package:follow_up/Model/packages.dart';
import 'package:follow_up/Model/status_details.dart';
import 'package:follow_up/Model/transactions.dart';
import 'package:follow_up/Model/user.dart';
import 'package:follow_up/Model/withdrawel.dart';
import 'package:get/get.dart';

class FetchData extends GetxService {
  HttpBaseClient baseClient = HttpBaseClient();
  LoginController loginController = Get.find();
  Future<void> fetchData() async {
    var loginHeader = loginController.getHeaders();
    var studentBody = {'user_type': 'student'};
    var encodedStudentBody = jsonEncode(studentBody);

    var response = await baseClient.postRequest(
      'user-list',
      loginHeader,
      encodedStudentBody,
    );

    List responseAsList = response;
    print(response);
    // Convert each map in the response to your model class

    List<UserDetails> userDetailsList = responseAsList
        .map((userData) => UserDetails(
              id: userData['user_id'],
              username: userData['username'],
            ))
        .toList();

    // Get or open the Hive box

    // Clear the existing data if needed

    var moderatorBody = {'user_type': 'moderator'};
    var encodedModeratorBody = jsonEncode(moderatorBody);

    var responses = await baseClient.postRequest(
      'user-list',
      loginHeader,
      encodedModeratorBody,
    );

    // print('objecthdbhbhbjdhfdhbfhb');
    // print(responses);

    List responsesAsList = responses;

    // Convert each map in the response to your model class
    List<ModeratorDetails> moderatorDetailsList = responsesAsList
        .map((userData) => ModeratorDetails(
              m_id: userData['user_id'],
              moderatorName: userData['username'],
            ))
        .toList();

    // Get or open the Hive box
    // Clear the existing data if needed

    // Save the user details to the Hive box

    // var statusBody = {'user-type': 'moderator'};
    // var encodedStatusBody = jsonEncode(statusBody);

    var responsess = await baseClient.getRequest(
      'list-status-field',
      loginHeader,

      // encodedModeratorBody,
    );

    // List responsessAsList = responsess;

    // // Convert each map in the response to your model class
    // List<StatusDetails> statusDetailsList = responsessAsList
    //     .map((userData) => StatusDetails(
    //           s_Id: userData['id'],
    //           status: userData['status_name'],
    //         ))
    //     .toList();

    // Get or open the Hive box

    var responsepackage = await baseClient.getRequest(
      'list-packages',
      loginHeader,

      // encodedModeratorBody,
    );

    List responsepackageList = responsepackage;

    // Convert each map in the response to your model class
    List<PackagesDetails> packageDetailsList = responsepackageList
        .map((userData) => PackagesDetails(
              p_id: userData['id'],
              packageName: userData['package_name'],
            ))
        .toList();

    // Get or open the Hive box
    // var mboxxss = PackageDetailsDB().box;
    // // Clear the existing data if needed
    // await mboxxss.clear();

    // await mboxxss.addAll(packageDetailsList);

    var responseTransaction = await baseClient.getRequest(
      'list-all-transactions',
      loginHeader,
    );

    List responseTransList = responseTransaction;

    List<TransactionDetails> transactionList =
        responseTransList.map((userData) {
      var dateString = userData['date'];
      var dateTime =
          HttpDate.parse(dateString); // Parse RFC 3339 formatted date string
      return TransactionDetails(
          t_id: userData['id'], // Ensure 'id' is treated as int
          amount:
              userData['amount'].toInt(), // Ensure 'amount' is treated as int
          date: dateTime);
    }).toList();

    var encodedInvoiceBody = jsonEncode(moderatorBody);

    var responseInvoice = await baseClient.postRequest(
      'list_all_invoices',
      loginHeader,
      encodedInvoiceBody,
    );

    List responseInvoiceList = responseInvoice;
    List<InvoiceDetails> invoiceDetailsList =
        responseInvoiceList.map((userData) {
      var dateString = userData['date'];
      var datesTime = HttpDate.parse(dateString);
      return InvoiceDetails(
          iv_id: userData['id'],
          packageName: userData['packagename'],
          amount: userData['amount'].toInt(),
          userName: userData['user_name'],
          userid: userData['user_id'],
          date: datesTime);
    }).toList();

    var encodedHistoryBody = jsonEncode(moderatorBody);

// Make the POST request
    var responseHistory = await baseClient.postRequest(
      'view-communication-history',
      loginHeader,
      encodedInvoiceBody,
    );

    List responseHistoryList = responseHistory;
    List<HistoryDetails> historyDetailsList =
        responseHistoryList.map((historyItem) {
      var dateString = historyItem['next_appointment_date'];
      var datesTime = HttpDate.parse(dateString);
      var datesString = historyItem['date'];
      var datessTime = HttpDate.parse(datesString);
      return HistoryDetails(
        comments: historyItem['comments'],
        nextappoinmentdate: datesTime,
        status_name: historyItem['status_name'],
        appoinmentdate: datessTime,
        id: historyItem['id'],
      );
    }).toList();

    var responseWithdrawel = await baseClient.getRequest(
      'view-withdrawal-request',
      loginHeader,
    );
    List responseWithdrawelList = responseWithdrawel;

    List<WithdrawelDetails> withdrawelList =
        responseWithdrawelList.map((userData) {
      var dateString = userData['date'];
      var dateTime =
          HttpDate.parse(dateString); // Parse RFC 3339 formatted date string
      return WithdrawelDetails(
          amount:
              userData['amount'].toInt(), // Ensure 'amount' is treated as int
          date: dateTime,
          w_id: userData['id'],
          status: userData['status'],
          user_id: userData['user_id']);
    }).toList();

    var responseCustomerForm = await baseClient.getRequest(
      'view-member-form-field',
      loginHeader,
    );
    print('responseCustomerForm');

    print(responseCustomerForm);
    print('responseCustomerForm');

    print(responseCustomerForm);
    // List responseCustomerFormList = responseCustomerForm;

    // List<CustomerformDetails> CustomerList =
    //     responseCustomerFormList.map((userData) {
    //   return CustomerformDetails(
    //     id: userData['items']['id'],
    //     formname: userData['items']['is_active'],
    //     fieldname: userData['items']['field_name'],
    //     feildtype: userData['items']['field_type'],
    //     defaultvalue: userData['items']['default_value'],
    //     required: userData['items']['required'],
    //     includedreg: userData['items']['include_in_reg_form'],
    //     modifiedby: userData['items']['modified_by'],
    //   );
    // }).toList();
    // var cbox = CustomerformDetailsDB().box;

    // await cbox.clear();

    // await cbox.addAll(CustomerList);
    // var encodedHistoryBody = jsonEncode(moderatorBody);

    // var responseHistory = await baseClient.postRequest(
    //   'view-communication-history',
    //   loginHeader,
    //   encodedHistoryBody,
    // );
    // print(responseHistory);
    // print('responseHistory');
    // List responseHistoryList = responseHistory;
    // List<HistoryDetails> historyDetailsList =
    //     responseInvoiceList.map((userData) {
    //   var dateString = userData['date'];
    //   var datesTime = HttpDate.parse(dateString);
    //   var datesString = userData['next_appointment_date'];
    //   var datessTime = HttpDate.parse(dateString);
    //   return HistoryDetails(
    //       h_id: userData['user_id'],
    //       comments: userData['comments'] ?? "comm",
    //       nextappoinmentdate: datesTime,
    //       status_name: userData['status_name'],
    //       appoinmentdate: datessTime);
    // }).toList();
    // print(historyDetailsList[0].status_name);
    // print('dhhhhhhhhhhhhhhhhhhhhh');

    // var historybox = HistoryDetailsDB().box;

    // await historybox.clear();
    // await historybox.addAll(historyDetailsList);
  }
}
