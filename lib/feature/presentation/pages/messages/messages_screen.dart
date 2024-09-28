import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_app_bar.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/messages_controller.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/coreComponents/common_input_field.dart';
import '../../../../components/styles/appColors.dart';
import '../../../../components/styles/appImages.dart';
import '../../widgets/common_action_btn.dart';
import '../../widgets/common_scaffold_widget.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MessagesController(),
      builder: (MessagesController controller) {
        return CommonScaffold(
          onBackTap: (){
            context.pop();
          },
          //hasDrawer:true,
          title: AppStrings.messages,
          resizeToAvoidBottomInset: false,
          floatingActionBtn: CommonActionBtn(),
          body: ListView(
            children: [
              CommonInputField(
                  underLineBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: AppColors.darkBlue)),
                  leading: SizedBox(
                    height: 25,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(AppImages.search),
                    ),
                  ),
                  controller: controller.searchCtrl,
                  hint: AppStrings.search),
              ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
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
                                  text: 'Alex Linderson',
                                  style: 16.txtMediumLBlack),
                              TextView(
                                  margin:
                                      const EdgeInsets.only(left: 8, top: 4),
                                  text: 'Don’t miss to attend the meeting.',
                                  style: 12.txtRegularLBlack)
                            ],
                          )),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextView(
                                  margin:
                                      const EdgeInsets.only(left: 8, bottom: 4),
                                  text: '2 min. ago',
                                  style: 13.txtRegularLBlack),
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: AppColors.primaryBlue,
                                child: Center(
                                    child: TextView(
                                  text: "1",
                                  style: 10.txtBoldWhite,
                                )),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 10)
            ],
          ),
        );
      },
    );
  }
}
