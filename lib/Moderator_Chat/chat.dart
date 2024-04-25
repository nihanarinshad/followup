import 'package:flutter/material.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:intl/intl.dart';

class ModeratorChat extends StatefulWidget {
  const ModeratorChat({Key? key});

  @override
  State<ModeratorChat> createState() => _EnquryChatScreenState();
}

class _EnquryChatScreenState extends State<ModeratorChat> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarText: 'Chat',
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            color: Colors.white,
            border: Border.all(
              color: Colors.red,
            )),
        height: 60,
        padding: EdgeInsets.only(bottom: 10, left: 10, top: 10),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Write a Message',
                  hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                      fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                        color: Colors
                            .transparent), // Set enabled border color to transparent
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Colors
                            .transparent), // Set focused border color to transparent
                  ),
                ),
                controller: _messageController,
              ),
            ),
            IconButton(
                onPressed: () {
                  _sendMessage(isUser: true);
                },
                icon: Icon(
                  Icons.send_outlined,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }

  void _sendMessage({required bool isUser}) {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(
          text: _messageController.text,
          isUser: isUser,
          dateTime: DateTime.now(),
        ));
        _messageController.clear();
      });
    }
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;
  final DateTime dateTime;

  const ChatMessage(
      {required this.text, required this.isUser, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment:
                isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage:
                    AssetImage('assets/baby.jpg'), // Add your avatar image here
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 11.0),
                alignment:
                    isUser ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  height: 100,
                  width: 200,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: isUser ? Colors.white : Colors.green,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                '${DateFormat.yMd().add_jm().format(dateTime)}',
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Row(
                mainAxisAlignment:
                    isUser ? MainAxisAlignment.start : MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/baby.jpg'), // Add your avatar image here
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    alignment:
                        isUser ? Alignment.centerLeft : Alignment.centerLeft,
                    child: Container(
                      height: 100,
                      width: 200,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.white : Colors.green,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    '${DateFormat.yMd().add_jm().format(dateTime)}',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
