import 'package:flutter/material.dart';

class PartnMyprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 36,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                ListTile(
                  title: Text('Email', style: TextStyle(color: Colors.grey)),
                  trailing: Text('nihana@gmail.com',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                Divider(),
                ListTile(
                  title: Text('DOB', style: TextStyle(color: Colors.grey)),
                  trailing: Text('14-07-2003',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                Divider(),
                ListTile(
                  title:
                      Text('phonenumber', style: TextStyle(color: Colors.grey)),
                  trailing: Text('9048402571',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                Divider(),
                ListTile(
                  title: Text('Gender', style: TextStyle(color: Colors.grey)),
                  trailing: Text('female',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                Divider(),
                ListTile(
                  title: Text('''Educational 
Qualification ''', style: TextStyle(color: Colors.grey)),
                  trailing: Text('Degree',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          child: ListTile(
            leading: Text(
              'Wallet',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 9, 20, 148),
                  Color.fromARGB(255, 16, 0, 54),
                ], begin: Alignment.topCenter, end: Alignment.topRight),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Text(
                '5000',
                style: TextStyle(color: Colors.white),
              )),
              height: 40,
              width: 100,
            ),
            // trailing: ElevatedButtonz,
          ),
        ),
      ),
    ]);
  }
}
