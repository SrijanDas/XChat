import 'package:XChat/models/chat_model.dart';
import 'package:XChat/models/message_model.dart';
import 'package:XChat/models/user_model.dart';
import 'package:XChat/utils/colors.dart';
import 'package:XChat/utils/scroll_physics.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;

  const ChatScreen({Key? key, required this.chat}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [
    Message(
        chatId: "fkldjgl",
        readBy: [User(name: "patrick", userId: "userId")],
        senderId: "srijan",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
    Message(
        chatId: "fkldjgl",
        readBy: [User(name: "srijan", userId: "userId")],
        senderId: "patrick",
        content: "Lorem ipsum dolor sit amet"),
    Message(
        chatId: "fkldjgl",
        readBy: [User(name: "patrick", userId: "userId")],
        senderId: "srijan",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
    Message(
        chatId: "fkldjgl",
        readBy: [User(name: "srijan", userId: "userId")],
        senderId: "patrick",
        content: "Lorem ipsum dolor sit amet"),
    Message(
        chatId: "fkldjgl",
        readBy: [User(name: "patrick", userId: "userId")],
        senderId: "srijan",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
    Message(
        chatId: "fkldjgl",
        readBy: [User(name: "srijan", userId: "userId")],
        senderId: "patrick",
        content: "Lorem ipsum dolor sit amet"),
    Message(
        chatId: "fkldjgl",
        readBy: [User(name: "patrick", userId: "userId")],
        senderId: "srijan",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
    Message(
        chatId: "fkldjgl",
        readBy: [User(name: "srijan", userId: "userId")],
        senderId: "patrick",
        content: "Lorem ipsum dolor sit amet"),
    Message(
        chatId: "fkldjgl",
        readBy: [User(name: "patrick", userId: "userId")],
        senderId: "srijan",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
    Message(
        chatId: "fkldjgl",
        readBy: [User(name: "srijan", userId: "userId")],
        senderId: "patrick",
        content: "Lorem ipsum dolor sit amet"),
    Message(
        chatId: "fkldjgl",
        readBy: [User(name: "patrick", userId: "userId")],
        senderId: "srijan",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
    Message(
        chatId: "fkldjgl",
        readBy: [User(name: "srijan", userId: "userId")],
        senderId: "patrick",
        content: "Last message"),
  ];

  final String currentUser = "srijan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            splashRadius: 16.0,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: primaryColor,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.chat.chatIcon),
                radius: 18,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.chat.chatName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "Online",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.videocam),
                splashRadius: 18.0),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.call),
                splashRadius: 18.0),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                splashRadius: 18.0),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: scrollPhysics,
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 60.0),
              child: Column(
                children: messages
                    .map((m) => Align(
                          alignment: m.senderId == currentUser
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: m.senderId == currentUser
                                  ? Colors.blue[200]
                                  : Colors.grey.shade200,
                            ),
                            padding: const EdgeInsets.all(14.0),
                            margin: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              m.content,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        semanticContainer: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {},
                                splashRadius: 18.0,
                                icon: Icon(Icons.emoji_emotions_outlined,
                                    color: grey)
                            ),
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Write message...",
                                    hintStyle: TextStyle(color: Colors.black54),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            IconButton(
                                splashRadius: 18.0,
                                onPressed: () {},
                                icon: Icon(Icons.attach_file, color: grey)),
                            IconButton(
                                splashRadius: 18.0,
                                onPressed: () {},
                                icon: Icon(Icons.photo_camera, color: grey))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: primaryColor,
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
