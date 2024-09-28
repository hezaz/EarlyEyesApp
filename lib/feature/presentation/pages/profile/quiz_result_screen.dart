import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/controller/profile_controller.dart';
import 'package:early_eyes/feature/presentation/widgets/common_card.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../components/styles/appColors.dart';


class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return CommonScaffold(
            onBackTap: () {
              context.pop();
            },
            title: AppStrings.quizResult,
            body: ListView(padding: EdgeInsets.zero, children: [
              SizedBox(
                height: context.getHeight / 2.0,
                child: Stack(
                  children: [
                    Container(
                      height: context.getHeight / 2.5,
                      color: AppColors.primaryBlue.withOpacity(0.4),
                      child: Stack(
                        children: [
                          Padding(padding: const EdgeInsets.only(top:24,left: 24),
                          child:commonCard(),
                          ),
                        Align(
                          alignment: Alignment.centerRight,
                          child:  Padding(padding: const EdgeInsets.only(top:24,left: 24),
                            child:commonCard(),
                          ),
                        ),
                          Align(
                            alignment: Alignment.centerRight,
                            child:  Padding(padding: const EdgeInsets.only(top:24,left: 50),
                              child:commonCard(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child:  Padding(padding: const EdgeInsets.only(top:24,left: 84),
                              child:commonCard(),
                            ),
                          ),
                          Center(
                            child: Lottie.asset(
                              'assets/lottie/Animation - 1720157164054.json',
                              height: 250.0,
                              repeat: true,
                              reverse: true,
                              animate: true,
                            ),
                          ),
                          Center(
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              height: 90,
                              width: 90,
                              child: Center(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Your Score',
                                        style: 14.txtMediumPBlue),
                                    TextSpan(
                                        text: '\n100 ', style: 18.txtBoldPBlue),
                                    TextSpan(
                                        text: 'pt', style: 14.txtMediumPBlue),
                                  ]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: CommonCard(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.all(16),
                        bkColor: Colors.white,
                        height: 150,
                        child: GridView.builder(
                            itemCount: 4,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 16,
                              childAspectRatio: 3 / 1,
                              crossAxisSpacing: 6,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                      radius: 7,
                                      backgroundColor: index < 2
                                          ? AppColors.primaryBlue
                                          : index == 2
                                              ? AppColors.green
                                              : AppColors.red),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                            text: index == 0
                                                ? '100%'
                                                : index == 1
                                                    ? '20'
                                                    : index == 2
                                                        ? '13'
                                                        : "7",
                                            style: 13.txtMediumPBlue),
                                        TextView(
                                            text: index == 0
                                                ? 'Completion'
                                                : index == 1
                                                    ? 'Total Question'
                                                    : index == 2
                                                        ? 'Correct'
                                                        : 'Wrong',
                                            style: 12.txtRegularDBlue),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0, left: 18, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      controller.quizOptions.length,
                      (index) => GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              context.pushNavigator(
                                  controller.quizOptions[index].child!);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  controller.quizOptions[index].image
                                      .toString(),
                                  height: 24,
                                ),
                                TextView(
                                  margin: const EdgeInsets.only(top: 8),
                                  text: index == 0
                                      ? 'View Result'
                                      : index == 1
                                          ? 'Retake Quiz'
                                          : 'Share Score',
                                  style: 15.txtRegularBlack,
                                )
                              ],
                            ),
                          )),
                ),
              )
            ]));
      },
    );
  }

  commonCard() {
    return Container(
      height: 40,
      width: 40,
      decoration:  BoxDecoration(
          shape: BoxShape.circle, color: AppColors.primaryBlue.withOpacity(0.5)),
    );
  }
}
