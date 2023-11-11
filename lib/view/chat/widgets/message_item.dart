import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final bool isSender;
  final String message;
  const MessageItem({
    required this.isSender,
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: isSender ? Colors.blue : Colors.amber,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 3,)]),
      child: Text(message,style: TextStyle(color:isSender?Colors.white:Colors.black),),
    );
  }
}
