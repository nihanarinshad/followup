import 'package:flutter/material.dart';
import 'package:follow_up/Partner/chat..dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:get/get.dart';

class PartnerModerator extends StatefulWidget {
  const PartnerModerator({super.key});

  @override
  State<PartnerModerator> createState() => _ModeratorState();
}

class _ModeratorState extends State<PartnerModerator> {
  final List<String> ModeratorList = [
    'Moderator 1',
    'Moderator 2',
    'Moderator 3',
    'Moderator 4',
    'Moderator 5'
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarText: 'Students',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: ModeratorList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Get.to(PartnerChat());
                },
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 20,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/baby.jpg'),
                        radius: 18,
                      ),
                    ),
                    title: Text(
                      ModeratorList[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
