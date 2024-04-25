import 'package:flutter/material.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Tenant.Partners/parnerview.dart';
import 'package:get/get.dart';

class TenantPartners extends StatefulWidget {
  const TenantPartners({Key? key}) : super(key: key);

  @override
  State<TenantPartners> createState() => _TenantPartnersState();
}

class _TenantPartnersState extends State<TenantPartners> {
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
                        Get.to(partneruser());
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
