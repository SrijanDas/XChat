import 'package:XChat/models/user_model.dart';

class Message {
  final String chatId;
  final List<User> readBy;
  final String senderId;
  final String content;

  Message({
    required this.chatId,
    required this.readBy,
    required this.senderId,
    required this.content,


  });
}