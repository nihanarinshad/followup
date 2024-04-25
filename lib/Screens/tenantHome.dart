import 'package:flutter/material.dart';
import 'package:follow_up/Screens/tenant_transaction.dart';
import 'package:follow_up/Tabbar_Tanent/student_tabbar.dart';
import 'package:follow_up/Tabbar_Tanent/withdrawelrequest_tabbar.dart';
import 'package:follow_up/Tenant.Partners/Partners.dart';
import 'package:follow_up/Tenant_Invoice.dart/Invoice.dart';
import 'package:follow_up/Tenant_Moderator.dart/moderator.dart';
import 'package:follow_up/Tenant_Withdrawelrequest/Withdrawelrequest.dart';
import 'package:follow_up/Tenant_package/package.dart';
import 'package:follow_up/Widgets/CircleavathraText.dart';
import 'package:get/get.dart';

class TenantHomeContainers extends StatelessWidget {
  const TenantHomeContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          padding: EdgeInsets.only(top: 20),
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(width: 10),
                    Circleavathartext(
                      backgroundColor: Color.fromARGB(255, 253, 213, 226),
                      onPressed: () {
                        Get.to(StudentTabbarrs());
                      },
                      icon: Icons.people_sharp,
                      iconColor: Colors.pink,
                      text: 'Students',
                    ),
                    Circleavathartext(
                      backgroundColor: Color.fromARGB(255, 248, 222, 197),
                      onPressed: () {
                        Get.to(Package());
                      },
                      icon: Icons.shopify_outlined,
                      iconColor: Colors.brown,
                      text: 'Packages',
                    ),
                    Circleavathartext(
                      backgroundColor: Color.fromARGB(255, 210, 249, 220),
                      onPressed: () {
                        Get.to(TenantTransaction());
                      },
                      icon: Icons.monetization_on,
                      iconColor: Colors.green,
                      text: 'Transactions',
                    ),
                    // SizedBox(width: 10),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(width: 10),
                    Circleavathartext(
                      backgroundColor: Color.fromARGB(255, 244, 219, 151),
                      onPressed: () {
                        Get.to(Invoice());
                      },
                      icon: Icons.file_copy,
                      iconColor: Color.fromARGB(255, 115, 112, 45),
                      text: 'Invoice',
                    ),
                    Circleavathartext(
                      backgroundColor: Color.fromARGB(255, 221, 221, 221),
                      onPressed: () {
                        Get.to(TenantPartners());
                      },
                      icon: Icons.people_outline_sharp,
                      iconColor: Colors.grey,
                      text: 'Partners',
                    ),
                    Circleavathartext(
                      backgroundColor: Color.fromARGB(255, 233, 248, 212),
                      onPressed: () {
                        Get.to(TenantModerator());
                      },
                      icon: Icons.people_outline_sharp,
                      iconColor: Colors.green,
                      text: 'Moderators',
                    ),
                    // SizedBox(width: 10),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(width: 25),
                    Circleavathartext(
                      backgroundColor: Color.fromARGB(255, 200, 236, 244),
                      onPressed: () {
                        Get.to(WithdrawelRequestTabbarrs());
                      },
                      icon: Icons.reset_tv_rounded,
                      iconColor: Colors.blue,
                      text: 'Withdrawal\nRequests',
                    ),
                    // SizedBox(),
                    // SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
