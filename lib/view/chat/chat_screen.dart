import 'package:chat_app/services/chat_service.dart';
import 'package:chat_app/view/chat/widgets/message_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
  final _messageController = TextEditingController();
  final _chatService = ChatService();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.email),
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: _buildMessagesList(),
            ),
            Container(
              height: 15.w,
              decoration: BoxDecoration(color:Colors.white,boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1),blurRadius: 3, offset: const Offset(3, -4))]),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      controller: _messageController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        border: InputBorder.none,
                        hintText: 'Enter a message...',
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  SizedBox(
                    height: 15.w,
                    width: 15.w,
                    child: ElevatedButton(
                      onPressed: sendMessage,
                      child: const Icon(Icons.send),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void sendMessage() async {
    if (_messageController.text.trim().isNotEmpty) {
      await _chatService.sendMessage(widget.id, _messageController.text.trim());
      _messageController.clear();
    }
  }

  Widget _buildMessagesList() {
    return StreamBuilder(
      stream: _chatService.getMessages(widget.id, _auth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text(
            'Error',
            style: TextStyle(color: Colors.red),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  Center(child: SizedBox(height:20.w,width:20.w,child: const CircularProgressIndicator()));
        }
        return ListView(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 7),
          children: snapshot.data!.docs.map((e) => _buildItem(e)).toList(),
        );
      },
    );
  }

  Widget _buildItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final bool isSender = data['senderId'] == _auth.currentUser!.uid;
    var alignment = isSender ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            data['senderEmail'],
            style: TextStyle(color: Colors.grey[700]),
          ),
          const SizedBox(
            height: 3,
          ),
          MessageItem(isSender: isSender, message: data['message']),
        ],
      ),
    );
  }
}
