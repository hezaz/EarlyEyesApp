import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/pages/messages/preferences.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chat_bubble.dart';
import 'message_input_field.dart';


class IndividualChatScreen extends StatefulWidget {
  final String userName;
  final String profileImage;
  final List<Map<String, dynamic>> messages;

  const IndividualChatScreen({
    Key? key,
    required this.userName,
    required this.profileImage,
    required this.messages,
  }) : super(key: key);

  @override
  _IndividualChatScreenState createState() => _IndividualChatScreenState();
}

class _IndividualChatScreenState extends State<IndividualChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  String getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat("hh:mm a").format(now);
    return formattedTime;
  }

  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        widget.messages.add({
          'sid': Preferencesu.uid,
          'message': message,
          'isMe': true,
          'time': getCurrentTime(),
        });
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: TextView(text: AppStrings.message,style: 20.txtMediumprimaryblue,)
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(AppImages.profile1)
                  // NetworkImage(widget.profileImage),
                ),
                SizedBox(width: 10),
                TextView(text: widget.userName, style: 20.txtMediumBlack),
              ],
            ),
          ),
          Divider(thickness: 0.5,
          color: AppColors.grey76,
          ),
          Expanded(
            child: ListView.builder(
              reverse: false,
              itemCount: widget.messages.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> messageData = widget.messages[index];
                return ChatBubble(
                  message: messageData['message'],
                  isMe: messageData['sid'] == Preferencesu.uid,
                  time: messageData['time'],
                );
              },
            ),
          ),
          MessageInputField(
            controller: _messageController,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}

