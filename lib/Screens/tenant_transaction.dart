import 'package:flutter/material.dart';
import 'package:follow_up/Controller/transactioncontroller.dart';
import 'package:follow_up/Model/transactions.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TenantTransaction extends StatefulWidget {
  const TenantTransaction({super.key});

  @override
  State<TenantTransaction> createState() => _TenantTransactionState();
}

class _TenantTransactionState extends State<TenantTransaction> {
  final TransactionController transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Column(children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: TransactionDetailsDB().box.listenable(),
                builder: (BuildContext context, value, Widget? child) {
                  final box = TransactionDetailsDB().box;

                  transactionController.trasactionDetailsList.value =
                      box.values.toList();

                  transactionController.trasactionDetailsList.value =
                      transactionController.trasactionDetailsList.reversed
                          .toList();
                  return ListView.builder(
                      itemCount:
                          transactionController.trasactionDetailsList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(20),
                              color: Colors.white,
                            ),
                            child: ListView(children: [
                              ListTile(
                                leading: Text(
                                  transactionController
                                      .trasactionDetailsList[index].t_id
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                title: Center(
                                    child: Text(
                                        transactionController
                                            .trasactionDetailsList[index].date
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14))),
                                trailing: Text(
                                    transactionController
                                        .trasactionDetailsList[index].amount
                                        .toString(),
                                    style: TextStyle(fontSize: 14)),
                              ),
                            ]),
                          ),
                        );
                      });
                }),
          )
        ]),
        appBarText: 'Transactions');
  }
}
