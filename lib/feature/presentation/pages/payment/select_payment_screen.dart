import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/coreComponents/common_button.dart';
import '../../../controller/payment_controller.dart';
import '../../widgets/common_tile.dart';

class SelectPaymentScreen extends StatelessWidget {
  const SelectPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PaymentController(),
      builder: (PaymentController controller) {
        return CommonScaffold(
          onBackTap: () {
            context.pop();
          },
          body: Column(
            children: [
              TextView(
                  text: AppStrings.selectPaymentMode,
                  style: 18.txtBoldDarkBlue),
              ListView.separated(
                  padding: const EdgeInsets.only(top: 32),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CommonTile(
                        padding: const EdgeInsets.only(right: 16),
                        margin: const EdgeInsets.only(left: 38, bottom: 8),
                        selectedIndex: controller.selectedCard,
                        currentIndex: index,
                        title: controller.joinType[index].title.toString(),
                        subtitle:
                            controller.joinType[index].subtitle.toString(),
                        image: controller.joinType[index].image.toString(),
                        onTap: controller.setIndex);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                  itemCount: controller.joinType.length),
              const Spacer(),
              CommonButton(
                  margin: EdgeInsets.only(
                      bottom: context.getHeight / 15, left:32, right:32),
                  text: AppStrings.next,
                  clickAction: () {}),
            ],
          ),
        );
      },
    );
  }
}
