import 'package:flutter/material.dart';
import 'package:follow_up/Moderator_Chat/chat.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:get/get.dart';

class Moderatoruser extends StatefulWidget {
  const Moderatoruser({super.key});

  @override
  State<Moderatoruser> createState() => _ModeratorState();
}

class _ModeratorState extends State<Moderatoruser> {
  final List<String> ModeratorList = [
    'User 1',
    'User 2',
    'User 3',
    'User 4',
    'User 5'
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
                  Get.to(ModeratorChat());
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
