import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String email;
  final String id;
  const ChatScreen({
    required this.email,
    required this.id,
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.email),automaticallyImplyLeading: true,),
    );
  }
}
