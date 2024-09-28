import 'package:early_eyes/components/coreComponents/ImageView.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/feature/controller/home_controller.dart';
import 'package:early_eyes/feature/presentation/widgets/common_card.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        return SizedBox(
          // color: AppColors.primaryBlue,
          width: context.getWidth,
          height: 155,
          child: Obx(
            () => ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CommonCard(
                    radius: 16,
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: ImageView(
                      borderColor: AppColors.greyHint.withOpacity(0.1),
                        radiusWidth: 1.0,
                        hasBorder: true,
                        radius: 16,
                        fit: BoxFit.fitWidth,
                        width: context.getWidth/1.5,
                        imageType: ImageType.network,
                        url: controller.events[index].image.toString()),
                  );
                  // return CommonCard(
                  //     width: context.getWidth,
                  //   child: Image.network(
                  //       controller.events[index].image.toString()),
                  // );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16);
                },
                itemCount: controller.events.length),
          ),
        );
      },
    );
  }
}
