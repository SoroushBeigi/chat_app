import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListItem extends StatelessWidget {
  final Map<String, dynamic> data;
  ListItem({required this.data, super.key});
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Text(data['email']),
        onTap: () =>  GoRouter.of(context).pushNamed("chat", queryParameters: {'id': data['uid'], 'email': data['email']}),
      );
    }else{
      return const SizedBox();
    }
  }
}
