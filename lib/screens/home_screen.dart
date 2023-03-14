import 'package:XChat/models/chat_model.dart';
import 'package:XChat/models/user_model.dart';
import 'package:XChat/screens/chat_screen.dart';
import 'package:XChat/screens/new_chat_screen.dart';
import 'package:XChat/utils/colors.dart';
import 'package:XChat/utils/scroll_physics.dart';
import 'package:XChat/widgets/single_chat_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final Chat _chat = Chat(
    users: [User(name: "Patrick", userId: "dkddaslfda"), User(name: "Srijan", userId: "dsakfdaljksd")],
      chatIcon:
          'https://video-images.vice.com/articles/6220167816692d009cc68908/lede/1646270291522-screen-shot-2022-03-03-at-121754-pm.png',
      chatId: 'chatId',
      chatName: 'Patrick');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("XChat"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            splashRadius: 16.0,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              splashRadius: 16.0)
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: const <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text("Chats"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text("Status"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text("Calls"),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 100.0),
        physics: scrollPhysics,
        itemBuilder: (context, index) {
          return InkWell(
            child: const SingleChatWidget(),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChatScreen(chat: _chat),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NewChatScreen(),
            ),
          );
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.chat),
      ),
    );
  }
}
