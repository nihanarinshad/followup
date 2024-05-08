import 'package:flutter/material.dart';
import 'package:follow_up/Controller/invoiceController.dart';
import 'package:follow_up/Model/invoice.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Tabbar_TANENT/Invoice_tababr.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  final InvoiceController invoiceController = Get.put(InvoiceController());
  @override
  Widget build(BuildContext context) {
    print('before');
    print(
      invoiceController.invoiceDetailsList.length,
    );
    return BaseScreen(
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        InvoiceTabbar(),
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: InvoiceDetailsDB().box.listenable(),
              builder: (BuildContext context, value, Widget? child) {
                final box = InvoiceDetailsDB().box;

                invoiceController.invoiceDetailsList.value =
                    box.values.toList();

                invoiceController.invoiceDetailsList.value =
                    invoiceController.invoiceDetailsList.reversed.toList();
                return ListView.builder(
                  itemCount: invoiceController.invoiceDetailsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          color: Colors.white,
                        ),
                        child: Container(
                          child: ListTile(
                            title: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Invoice no: ',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      invoiceController
                                          .invoiceDetailsList[index].iv_id
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                        invoiceController
                                            .invoiceDetailsList[index].date
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                        ))
                                  ],
                                )
                              ],
                            //   Text(
                            // DateFormat.yMd()
                            //     .format(studentController.selectedDate.value),
                            // style: TextStyle(
                            //     fontWeight: FontWeight.bold, fontSize: 12)),
                            ),
                            subtitle: Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Colors.red,
                                    child: Icon(Icons.person)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        invoiceController
                                            .invoiceDetailsList[index].userName
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          invoiceController
                                              .invoiceDetailsList[index]
                                              .packageName
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            trailing: Column(
                              children: [
                                Text(
                                  'Amount',
                                  style: TextStyle(color: Colors.red),
                                ),
                                Text(
                                  invoiceController
                                      .invoiceDetailsList[index].amount
                                      .toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: 20,
                                  width: 90,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.settings, size: 10),
                                    label: Text('settle up',
                                        style: TextStyle(fontSize: 7)),
                                    onPressed: () {
                                      // Handle button press
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.red,
                                      elevation: 0,
                                      fixedSize: Size.fromWidth(100),
                                      maximumSize: Size.fromHeight(40),
                                      side: const BorderSide(
                                        width: 1.0,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
        )
      ]),
      appBarText: 'Invoices',
    );
  }
}
