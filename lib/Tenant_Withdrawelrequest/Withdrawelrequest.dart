import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:follow_up/Controller/withrawelcontroller.dart';

import 'package:get/get.dart';

class Withrdrawelrequest extends StatelessWidget {
  const Withrdrawelrequest({super.key});

  @override
  Widget build(BuildContext context) {
    final WithdrawelController withdrawelController =
        Get.put(WithdrawelController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 241, 241),
      body: FutureBuilder(
          future: withdrawelController.WidrawelListView(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: withdrawelController.withdrawlist.length,
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the radius as needed
                          color: Colors.white, // Set the background color
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Slidable(
                              startActionPane:
                                  ActionPane(motion: ScrollMotion(), children: [
                                SlidableAction(
                                    backgroundColor: Colors.green,
                                    onPressed: (context) {},
                                    icon: Icons.done)
                              ]),
                              endActionPane:
                                  ActionPane(motion: ScrollMotion(), children: [
                                SlidableAction(
                                  backgroundColor: Colors.red,
                                  onPressed: (context) {},
                                  icon: Icons.clear_outlined,
                                )
                              ]),
                              child: ListTile(
                                leading: Text(
                                  withdrawelController.withdrawlist[index]
                                          ['user_id']
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                title: Center(
                                    child: Text(
                                        withdrawelController.withdrawlist[index]
                                                ['date']
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14))),
                                trailing: Text(
                                    withdrawelController.withdrawlist[index]
                                            ['amount']
                                        .toString(),
                                    style: TextStyle(fontSize: 14)),
                              ),
                            )));
                  },
                );
              }
            }
            // Displaying LoadingSpinner to indicate waiting state
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );

    // Expanded(
    //   child: ValueListenableBuilder(
    //     valueListenable: TransactionDetailsDB().box.listenable(),
    //     builder: (BuildContext context, value, Widget? child) {
    //       final box = WithdrawelDetailsDB().box;

    //       withdrawelController.withdrawelDetailsList.value =
    //           box.values.toList();

    //       withdrawelController.withdrawelDetailsList.value =
    //           withdrawelController.withdrawelDetailsList.reversed.toList();
    //       return ListView.builder(
    //           itemCount: withdrawelController.withdrawelDetailsList.length,
    //           itemBuilder: (context, index) {
    //             return Container(
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(
    //                       20.0), // Adjust the radius as needed
    //                   color: Colors.white, // Set the background color
    //                 ),
    //                 margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    //                 child: ClipRRect(
    //                     borderRadius: BorderRadius.circular(20.0),
    //                     child: Slidable(
    //                       startActionPane:
    //                           ActionPane(motion: ScrollMotion(), children: [
    //                         SlidableAction(
    //                             backgroundColor: Colors.green,
    //                             onPressed: (context) {},
    //                             icon: Icons.done)
    //                       ]),
    //                       endActionPane:
    //                           ActionPane(motion: ScrollMotion(), children: [
    //                         SlidableAction(
    //                           backgroundColor: Colors.red,
    //                           onPressed: (context) {},
    //                           icon: Icons.clear_outlined,
    //                         )
    //                       ]),
    //                       child: ListTile(
    //                         leading: Text(
    //                           withdrawelController
    //                               .withdrawelDetailsList[index].w_id
    //                               .toString(),
    //                           style: TextStyle(
    //                               fontSize: 16, fontWeight: FontWeight.bold),
    //                         ),
    //                         title: Center(
    //                             child: Text(
    //                                 DateFormat.yMd().format(
    //                                     withdrawelController
    //                                         .withdrawelDetailsList[index]
    //                                         .date),
    //                                 style: TextStyle(
    //                                     color: Colors.grey, fontSize: 14))),
    //                         trailing: Text(
    //                             withdrawelController
    //                                 .withdrawelDetailsList[index].amount
    //                                 .toString(),
    //                             style: TextStyle(fontSize: 14)),
    //                       ),
    //                     )));
    //           });
    //     },
    //   ),
    // ),
  }
}
