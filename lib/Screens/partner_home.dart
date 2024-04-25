import 'package:flutter/material.dart';
import 'package:follow_up/Partner/invoice.dart';
import 'package:follow_up/Partner/my_profile.dart';
import 'package:follow_up/Partner/partner_moderator.dart';

import 'package:follow_up/Widgets/CircleavathraText.dart';
import 'package:get/get.dart';

class PartnerHomeContainer extends StatelessWidget {
  const PartnerHomeContainer({super.key});

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
                    Get.to(PartnerMyprofile());
                  },
                  icon: Icons.person_2_outlined,
                  iconColor: Colors.pink,
                  text: 'My Profile',
                ),
                Circleavathartext(
                  backgroundColor: Color.fromARGB(255, 248, 222, 197),
                  onPressed: () {
                    Get.to(PartnerInvoice());
                  },
                  icon: Icons.file_copy,
                  iconColor: Colors.brown,
                  text: 'Invoices',
                ),
                Circleavathartext(
                  backgroundColor: Color.fromARGB(255, 210, 249, 220),
                  onPressed: () {
                    Get.to(PartnerModerator());
                  },
                  icon: Icons.chat,
                  iconColor: Colors.green,
                  text: 'Moderator Chats',
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
