import 'package:XChat/models/user_model.dart';

class Chat {
  final String chatId;
  final String chatIcon;
  final String chatName;
  final bool isGroupChat;
  List<User> users;

  Chat(
      {required this.chatIcon,
      required this.chatId,
      required this.chatName,
      required this.users,
      this.isGroupChat = false});
}
