import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:follow_up/Controller/statusController.dart';
import 'package:follow_up/Model/status_details.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Widgets/ElevatedButton.dart';
import 'package:follow_up/Widgets/Textfieldwithouticononlyletters.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class statuss extends StatefulWidget {
  const statuss({super.key});

  @override
  State<statuss> createState() => _statussState();
}

class _statussState extends State<statuss> {
  TextEditingController statusadd = TextEditingController();
  TextEditingController statusedit = TextEditingController();
  final StatusController statusController = Get.put(StatusController());

  // This list stores the active status of each item

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarText: 'Status',
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: StatusDetailsDB().box.listenable(),
                      builder: (BuildContext context, value, Widget? child) {
                        final box = StatusDetailsDB().box;

                        statusController.statusDetailsList.value =
                            box.values.toList();

                        statusController.statusDetailsList.value =
                            statusController.statusDetailsList.reversed
                                .toList();
                        return ListView.builder(
                          itemCount: statusController.statusDetailsList.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              endActionPane:
                                  ActionPane(motion: ScrollMotion(), children: [
                                SlidableAction(
                                  backgroundColor:
                                      Color.fromARGB(255, 10, 246, 22),
                                  onPressed: (context) {
                                    _showalDialog(context);
                                  },
                                  icon: Icons.edit,
                                )
                              ]),
                              child: Card(
                                color: Colors.white,
                                child: ListTile(
                                  title: Text(
                                    statusController
                                        .statusDetailsList[index].status,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      })),
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                _showDialog(context);
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    bool valuesss = false;
    // String _textFieldValue = ''; // TextField value variable

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Create Status',
              style: TextStyle(
                color: Colors.red,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextfieldwithouticononlyLetters(
                Controllers: statusadd,
                Textadd: 'Status',
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Initial',
                    style: TextStyle(color: Colors.red),
                  ),
                  Checkbox(
                    value: valuesss,
                    onChanged: (value) {
                      setState(() {
                        valuesss = value!;
                      });
                    },
                  ) //
                ],
              ),
            ],
          ),
          actions: <Widget>[
            CustomElevatedButton(
              onPressed: () async {
                await statusController.addStatus(status: statusadd.text);
              },
              text: 'Add',
            )
          ],
        );
      },
    );
  }

  Future<void> _showalDialog(BuildContext context) async {
    bool valuesss = false;
    // String _textFieldValue = ''; // TextField value variable

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Create Status',
              style: TextStyle(
                color: Colors.red,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextfieldwithouticononlyLetters(
                Controllers: statusedit,
                Textadd: 'Status',
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Initial',
                    style: TextStyle(color: Colors.red),
                  ),
                  Checkbox(
                    value: valuesss,
                    onChanged: (value) {
                      setState(() {
                        valuesss = value!;
                      });
                    },
                  ) //
                ],
              ),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                text: 'Add',
              ),
            )
          ],
        );
      },
    );
  }
}
