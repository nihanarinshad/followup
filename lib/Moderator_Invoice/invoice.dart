import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_up/Moderator_Invoice/invoice_view.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Tabbar_TANENT/Invoice_tababr.dart';
import 'package:get/get.dart';

class ModeratorInvoice extends StatefulWidget {
  const ModeratorInvoice({super.key});

  @override
  State<ModeratorInvoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<ModeratorInvoice> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Column(children: [
          SizedBox(
            height: 20,
          ),
          InvoiceTabbar(),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(20),
                color: Colors.white,
              ),
              child: ListTile(
                title: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Invoice no: ',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '1234',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('11-02-2024',
                            style: TextStyle(
                              fontSize: 13,
                            ))
                      ],
                    )
                  ],
                ),
                subtitle: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/people-svgrepo-com.svg',
                      height: 30,
                    ),
                    Column(
                      children: [
                        Text(
                          'username',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text('package name',
                            style: TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
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
                      '5000/-',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
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
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            '1234',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('11-02-2024',
                              style: TextStyle(
                                fontSize: 13,
                              ))
                        ],
                      )
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/people-svgrepo-com.svg',
                        height: 30,
                      ),
                      Column(
                        children: [
                          Text(
                            'username',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text('package name',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey)),
                        ],
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
                        '5000/-',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 20,
                        width: 90,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.settings, size: 10),
                          label:
                              Text('settle up', style: TextStyle(fontSize: 7)),
                          onPressed: () {
                            Get.to(ModeratorInvoiceView());
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
          ),
        ]),
        appBarText: 'Invoice');
  }
}
