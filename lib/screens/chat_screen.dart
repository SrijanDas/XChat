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
  List<Message> messages = [
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
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _inputController;
  bool showSendBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _inputController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  void sendMessage() {
    setState(() {
      messages.add(Message(
          chatId: "chatId",
          readBy: [User(name: "patrick", userId: "userId")],
          senderId: currentUser,
          content: _inputController.text));

      showSendBtn = false;
    });

    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);

    _inputController.clear();
  }

  @override
  void dispose() {
    super.dispose();

    _inputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
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
            GestureDetector(
              onTap: (){
                FocusNode currentFocus = FocusScope.of(context);
                if(!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height - 175,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    controller: _scrollController,
                    physics: scrollPhysics,
                    addAutomaticKeepAlives: false,
                    cacheExtent: 100.0,
                    shrinkWrap: true,
                    itemCount: messages.length,
                    itemBuilder: (context, i) {
                      return Align(
                        alignment: messages[i].senderId == currentUser
                            ? Alignment.topRight
                            : Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: messages[i].senderId == currentUser
                                ? Colors.blue[200]
                                : Colors.grey.shade200,
                          ),
                          padding: const EdgeInsets.all(14.0),
                          margin: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            messages[i].content,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    }),
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Card(
                        semanticContainer: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {},
                                splashRadius: 18.0,
                                icon: Icon(Icons.emoji_emotions_outlined,
                                    color: grey)),
                            Expanded(
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,

                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      showSendBtn = true;
                                    });
                                  } else {
                                    setState(() {
                                      showSendBtn = false;
                                    });
                                  }
                                },

                                showCursor: true,
                                controller: _inputController,
                                decoration: const InputDecoration(
                                    hintText: "Write message...",
                                    hintStyle: TextStyle(color: Colors.black54),
                                    border: InputBorder.none),
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
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: FloatingActionButton(
                            onPressed: () => {
                              if(showSendBtn) {
                                sendMessage()
                              }
                              else {
                              //  record voice
                                print("record voice")
                              }
                            },
                            backgroundColor: primaryColor,
                            child: Icon(
                              showSendBtn ? Icons.send : Icons.mic,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
