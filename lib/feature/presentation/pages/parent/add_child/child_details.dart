
import 'package:early_eyes/components/coreComponents/ImageView.dart';
import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_button.dart';
import 'package:early_eyes/components/coreComponents/common_toast.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_card.dart';
import 'package:early_eyes/services/network/ApiUrls.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/child_controller.dart';
import '../../../widgets/empty_widget.dart';
import 'child_courses_detail_screen.dart';
import 'edit_child_screen.dart';

class ChildDetails extends StatelessWidget {
  ChildDetails({super.key});
  final childCtrl = Get.put(ChildController());

  @override
  Widget build(BuildContext context) {
    return
      Obx(
      () =>
      childCtrl.childLoader.value
          ? const Center(
            child: Column(
              children: [
                SizedBox(
                        height: 40,width: 40,
                        child: CircularProgressIndicator(color: AppColors.primaryBlue),
                      ),
              ],
            ),
          )
          :
      childCtrl.childDetails.isEmpty
              ? EmptyWidget()
              : ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  itemBuilder: (context, index) {
                    return Obx(
                      () => CommonCard(
                        onTap: (){
                          childCtrl.onCreateForm(childCtrl
                              .childDetails[index].id);
                          context.pushNavigator(ChildCoursesDetail());
                        },
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 70,
                                    width: 70,
                                    child: Obx(
                                      () => ImageView(
                                          fit: BoxFit.cover,
                                          radiusWidth: 1.2,
                                          size: 70,
                                          radius: 100,
                                          borderRadius: 100,
                                          imageType: ImageType.network,
                                          url:
                                              '${ApiUrls.baseUrlImage}${childCtrl.childDetails[index].userDetails?.profilePic.toString()}'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text:
                                              childCtrl.childDetails[index].fullName.toString(),

                                          style: 12.txtRegularLBlack),
                                      TextSpan(
                                          text: '\nAge: ',
                                          style: 12.txtMediumLBlack),
                                          TextSpan(
                                              text:
                                              childCtrl.childDetails[index].email.toString(),
                                              style: 12.txtRegularLBlack),
                                          TextSpan(
                                              text: '\nClass: ',
                                              style: 12.txtMediumLBlack),
                                      TextSpan(
                                          text:
                                              '${childCtrl.childDetails[index].userDetails?.userDetailsClass.toString()}',
                                          style: 12.txtRegularLBlack),
                                    ])),
                                  ),

                                  const Spacer(),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          childCtrl.onCreateForm(childCtrl
                                              .childDetails[index].id);

                                          context.pushNavigator(EditChildScreen());
                                          },
                                        child: Image.asset(AppImages.edit,
                                            height: 22),
                                      ),
                                      const SizedBox(height: 16.0),
                                      GestureDetector(
                                        onTap: () {
                                          context.openDialog(Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextView(
                                                  margin: const EdgeInsets.only(
                                                      top: 24),
                                                  textAlign: TextAlign.center,
                                                  text:
                                                      'Are you sure you want to delete this child details',
                                                  style: 20.txtSBoldBlack),
                                      Row(
                                                children: [
                                                  Expanded(
                                                      child: CommonButton(
                                                          isLoading: childCtrl
                                                              .deleteLoader,
                                                          borderRadius: 4,
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 16,
                                                                  right: 6,
                                                                  top: 16),
                                                          text: AppStrings.yes,
                                                          clickAction: () {
                                                            childCtrl
                                                                .deleteChild(childCtrl
                                                                    .childDetails[
                                                                        index]
                                                                    .id
                                                                    .toString())
                                                                .then((value) {
                                                              childCtrl
                                                                  .deleteLoader
                                                                  .value = false;
                                                              CommonToast.show(
                                                                  msg: value);
                                                            });
                                                          })),
                                                  Expanded(
                                                      child: CommonButton(
                                                          borderRadius: 4,
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 6,
                                                                  right: 16,
                                                                  top: 16),
                                                          text: AppStrings.no,
                                                          clickAction: () {
                                                            Get.back();
                                                          }))
                                                ],
                                              )
                                            ],
                                          ));
                                        },
                                        child: Image.asset(AppImages.delete,
                                            height: 22),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {

                    return const SizedBox();
                  },
                  itemCount: childCtrl.childDetails.length),
    );
  }
}
