import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
        children:const  [
          Center(
            child: Text(' ahmed erefd'
              ,style: TextStyle(color: Colors.black),),

          ),
        ]
    );
  }
}
