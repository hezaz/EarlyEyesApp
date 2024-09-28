import 'package:get/get.dart';

import '../../components/styles/appImages.dart';
import '../../components/styles/app_strings.dart';
import '../data/models/dataModels/common_model.dart';

class PaymentController extends GetxController{
  RxInt selectedCard = (-1).obs;

  setIndex(int index) {
    selectedCard.value = index;
  }
  var joinType = <CommonModel>[
    CommonModel(
      title: AppStrings.creditCardTxt,
      image: AppImages.creditCard,
      subtitle: AppStrings.cardDetails,
    ),
    CommonModel(
      title: AppStrings.bankTxt,
      image: AppImages.bank,
      subtitle: AppStrings.bankDetails,
    ),
    CommonModel(
      title: AppStrings.gPayTxt,
      image: AppImages.gPay,
      subtitle: AppStrings.upiDetails,
    ),
  ].obs;
}