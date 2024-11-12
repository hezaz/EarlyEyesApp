import 'package:early_eyes/components/coreComponents/ImageView.dart';
import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_input_field.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/pages/messages/individual_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../components/styles/appColors.dart';
import '../../../../components/styles/appImages.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<Map<String, dynamic>> messagesList = List.generate(
    10,
        (index) => {
      'id': index,
      'userName': 'Alex Linderson',
      'message': 'Don’t miss to attend the meeting.',
      'time': '2 min. ago',
      'unread': 1,
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: TextView(
          text: AppStrings.message,
          style: 20.txtMediumprimaryblue,
        ),
      ),
      floatingActionButton:  Positioned(
        bottom: 100.0,
        right: 35.0,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryBlue,
          ),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.transparent,
            child: Icon(Icons.add, color: AppColors.white, size: 20),
          ),
        ),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
              CommonInputField(
                  trailing: InkWell(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 50,
                        width: 50,
                        ),
                  ),
                  underLineBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: AppColors.darkBlue)),
                  leading: SizedBox(
                    height: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(AppImages.search),
                    ),
                  ),
                  hint: AppStrings.search, controller: null,),
            SingleChildScrollView(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: messagesList.length,
                itemBuilder: (context, index) {
                  var messageItem = messagesList[index];
        
                  return Dismissible(
                    key: Key(messageItem['id'].toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        messagesList.removeAt(index);
                      });
                      Get.snackbar(
                        'Success',
                        'Message deleted',
                        snackPosition: SnackPosition.TOP,
                        duration: Duration(seconds: 2),
                      );
        
                    },
                    background: Container(
                      color: AppColors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: ImageView(url: AppImages.del,
                        size: 30,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        List<Map<String, dynamic>> chatMessages = [
                          {
                            'sid': 1,
                            'message': 'hgdggfhgfhhjgiuyytdd',
                            'isMe': false,
                            'time': '09:25 AM',
                          },
                          {
                            'sid': 2,
                            'message': 'ghfhfhdhdtrrfdfdr',
                            'isMe': true,
                            'time': '09:26 AM',
                          },
                        ];
        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IndividualChatScreen(
                              userName: 'Alex Linderson',
                              profileImage: AppImages.profile1,
                              messages: chatMessages,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(AppImages.profile1),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    margin: const EdgeInsets.only(left: 8),
                                    text: messageItem['userName'],
                                    style: 16.txtMediumLBlack,
                                  ),
                                  TextView(
                                    margin: const EdgeInsets.only(left: 8, top: 4),
                                    text: messageItem['message'],
                                    style: 12.txtRegularLBlack,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextView(
                                  margin: const EdgeInsets.only(left: 8, bottom: 4),
                                  text: messageItem['time'],
                                  style: 13.txtRegularLBlack,
                                ),
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: AppColors.primaryBlue,
                                  child: Center(
                                    child: TextView(
                                      text: messageItem['unread'].toString(),
                                      style: 10.txtBoldWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            ),
          ],
        ),
      )

    );
  }
}
