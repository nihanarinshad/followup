import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_up/Controller/moderator_controller.dart';
import 'package:follow_up/Controller/transactioncontroller.dart';
import 'package:follow_up/Tenant_Moderator.dart/moderatorAdd.dart';
import 'package:follow_up/Tenant_Moderator.dart/moderator_edit.dart';
import 'package:follow_up/Tenant_Moderator.dart/moderator_eye.dart';

import 'package:get/get.dart';

import '../Controller/student_controller.dart';

class TenantTransaction extends StatefulWidget {
  TenantTransaction({super.key});

  @override
  State<TenantTransaction> createState() => _TenantStudentState();
}

class _TenantStudentState extends State<TenantTransaction> {
  final TransactionController transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 241, 241),
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text('Transaction'),
          foregroundColor: Colors.white,
        ),
        body: FutureBuilder(
            future: transactionController.TransactionListView(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount:
                        transactionController.trasactionssDetailsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(20),
                            color: Colors.white,
                          ),
                          child: ListView(children: [
                            ListTile(
                              leading: Text(
                                transactionController
                                    .trasactionssDetailsList[index]['id']
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              title: Center(
                                  child: Text(
                                      transactionController
                                          .trasactionssDetailsList[index]
                                              ['date']
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14))),
                              trailing: Text(
                                  transactionController
                                      .trasactionssDetailsList[index]['amount']
                                      .toString(),
                                  style: TextStyle(fontSize: 14)),
                            ),
                          ]),
                        ),
                      );
                    },
                  );
                }
              }
              // Displaying LoadingSpinner to indicate waiting state
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:follow_up/Controller/transactioncontroller.dart';
// import 'package:follow_up/Model/transactions.dart';
// import 'package:follow_up/Screens/BaseScreen.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class TenantTransaction extends StatefulWidget {
//   const TenantTransaction({super.key});

//   @override
//   State<TenantTransaction> createState() => _TenantTransactionState();
// }

// class _TenantTransactionState extends State<TenantTransaction> {
//   final TransactionController transactionController =
//       Get.put(TransactionController());

//   @override
//   Widget build(BuildContext context) {
//     return BaseScreen(
//         body: Column(children: [
//           SizedBox(
//             height: 20,
//           ),
//           Expanded(
//             child: ValueListenableBuilder(
//                 valueListenable: TransactionDetailsDB().box.listenable(),
//                 builder: (BuildContext context, value, Widget? child) {
//                   final box = TransactionDetailsDB().box;

//                   transactionController.trasactionDetailsList.value =
//                       box.values.toList();

//                   transactionController.trasactionDetailsList.value =
//                       transactionController.trasactionDetailsList.reversed
//                           .toList();
//                   return ListView.builder(
//                       itemCount:
//                           transactionController.trasactionDetailsList.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(
//                               top: 5, left: 10, right: 10),
//                           child: Container(
//                             height: 60,
//                             decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadiusDirectional.circular(20),
//                               color: Colors.white,
//                             ),
//                             child: ListView(children: [
//                               ListTile(
//                                 leading: Text(
//                                   transactionController
//                                       .trasactionDetailsList[index].t_id
//                                       .toString(),
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 title: Center(
//                                     child: Text(
//                                         transactionController
//                                             .trasactionDetailsList[index].date
//                                             .toString(),
//                                         style: TextStyle(
//                                             color: Colors.grey, fontSize: 14))),
//                                 trailing: Text(
//                                     transactionController
//                                         .trasactionDetailsList[index].amount
//                                         .toString(),
//                                     style: TextStyle(fontSize: 14)),
//                               ),
//                             ]),
//                           ),
//                         );
//                       });
//                 }),
//           )
//         ]),
//         appBarText: 'Transactions');
//   }
// }
