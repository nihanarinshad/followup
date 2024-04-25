import 'package:flutter/material.dart';
import 'package:follow_up/Moderator_Partner/partner_view.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:get/get.dart';

class ModeratorPartners extends StatefulWidget {
  const ModeratorPartners({Key? key}) : super(key: key);

  @override
  State<ModeratorPartners> createState() => _TenantPartnersState();
}

class _TenantPartnersState extends State<ModeratorPartners> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarText: 'Partners',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(5, (rowIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (columnIndex) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(Moderatorpartneruser());
                      },
                      child: Container(
                        height: 100,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage('assets/baby.jpg'),
                            ),
                            SizedBox(height: 8),
                            Text('User Name'),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
