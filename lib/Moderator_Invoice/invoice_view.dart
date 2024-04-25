import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Widgets/ElevatedButton.dart';
import 'package:follow_up/Widgets/TextfieldwithouticononlyNumbers.dart';
import 'package:follow_up/Widgets/Textfieldwithouticononlyletters.dart';

class ModeratorInvoiceView extends StatefulWidget {
  const ModeratorInvoiceView({super.key});

  @override
  State<ModeratorInvoiceView> createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<ModeratorInvoiceView> {
  TextEditingController Amount = TextEditingController();
  TextEditingController Comments = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
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
          SizedBox(
            height: 20,
          ),
          TextfieldwithouticononlyNumbers(
            Controllers: Amount,
            Textadd: 'Amount',
          ),
          TextfieldwithouticononlyLetters(
            Controllers: Comments,
            Textadd: 'Comments',
          ),
          SizedBox(
            height: 20,
          ),
          CustomElevatedButton(
            onPressed: () {},
            text: 'Settle',
          )
        ]),
        appBarText: 'Invoice');
  }
}
