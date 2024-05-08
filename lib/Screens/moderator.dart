import 'package:flutter/material.dart';

import 'package:follow_up/Moderator_Partner/partner.dart';
import 'package:follow_up/Screens/tenant_transaction.dart';
import 'package:follow_up/Tabbar_Tanent/student_tabbar.dart';
import 'package:follow_up/Tenant_Invoice.dart/Invoice.dart';

import 'package:follow_up/Widgets/CircleavathraText.dart';
import 'package:get/get.dart';

class ModeratorContainers extends StatelessWidget {
  const ModeratorContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 10),
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
                    // Get.to(PackageLists());
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
                SizedBox(width: 10),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 10),
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
                    Get.to(ModeratorPartners());
                  },
                  icon: Icons.people_outline_sharp,
                  iconColor: Colors.grey,
                  text: 'Partners',
                ),
                Circleavathartext(
                  backgroundColor: Color.fromARGB(255, 233, 248, 212),
                  onPressed: () {
                    // Get.to(TenantModerators());
                  },
                  icon: Icons.people_outline_sharp,
                  iconColor: Colors.green,
                  text: 'Chat',
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
