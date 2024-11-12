import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';

import '../styles/appColors.dart';
import '../styles/decoration.dart';
import 'TextView.dart';

class AppDropDown<T> extends StatelessWidget {
  final List<T> list;
  final bool isFilled;
  final Color? borderColor;
  final double? radius;
  final EdgeInsets? padding;
  final double? menuMaxHeight;
  final double? width;
  final Function(MenuController)? onCreateController;

  final bool isMultiDropDown;
  final List<T>? multiSelectedValue;
  final T? selectedValue;
  final Function(T) itemBuilder;
  final String? title;
  final Function(T)? singleValueBuilder;
  final Function(T)? multiValueBuilder;
  final Function(T)? onSingleChange;
  final Function(List<T>)? onMultiChange;
  final String? hint;
  final String? error;
  final Widget? textBox;
  Widget? icon;
  TextStyle? style;

   AppDropDown.multiSelect({
    super.key,
    this.isMultiDropDown = true,
    this.title,
    required this.list,
    required this.multiSelectedValue,
    required this.multiValueBuilder,
    required this.itemBuilder,
    required this.onMultiChange,
    this.onSingleChange,
    this.selectedValue,
    this.singleValueBuilder,
    this.hint,
    this.isFilled = false,
    this.borderColor,
    this.radius,
    this.padding,
    this.menuMaxHeight,
    this.width, this.textBox, this.onCreateController,
   this.style,this.icon, this.error,
  });

  AppDropDown.singleSelect({
    super.key,
    this.title,
    this.isMultiDropDown = false,
    required this.list,
    required this.selectedValue,
    required this.singleValueBuilder,
    required this.itemBuilder,
    required this.onSingleChange,
    this.onMultiChange,
    this.multiValueBuilder,
    this.multiSelectedValue,
    this.hint,
    this.isFilled = false,
    this.borderColor,
    this.radius,
    this.padding,
    this.menuMaxHeight,
    this.width, this.textBox, this.onCreateController,this.style,this.icon, this.error
  });

  @override
  Widget build(BuildContext context) {
    final borderStyle = AppDecoration.bDecorationGreyR(
        borderColor: borderColor, radius: radius ?? 10);
    String hintValue =
        hint != null && hint!.trim().isNotEmpty ? hint! : 'Choose...';
    String? value = generateValue();
    MenuController controller = MenuController();
    return _dropDownWidget(
   icon: icon,
        style: style,
        controller: controller,
        width: width,
        hintValue: hintValue,
        value: value,
        error: error,
        decoration: borderStyle,
        textBox: textBox,
        getController: (ctrl)=> onCreateController != null ? onCreateController!(ctrl) : null,
        menuList: [
          ...list.asMap().entries.map((e) => InkWell(
              onTap: () {
                if (isMultiDropDown) {
                  List<T> list = multiSelectedValue ?? [];
                  if (multiSelectedValue!.contains(e.value)) {
                    list.remove(e.value);
                  } else {
                    list.add(e.value);
                  }
                  onMultiChange!(list);
                } else {
                  controller.close();
                  onSingleChange!(e.value);
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.maxFinite,
                  color:
                      isMultiDropDown && multiSelectedValue!.contains(e.value)
                          ? AppColors.greyBg
                          : AppColors.white,
                  padding: const EdgeInsets.all(10),
                  child: TextView(text: itemBuilder(e.value) ?? '',style: 13.txtRegularDBlue,))))
        ]);
  }

  String? generateValue() {
    if (isMultiDropDown) {
      if (multiSelectedValue != null && multiSelectedValue!.isNotEmpty) {
        List<String> finalValue = [];
        for (var item in multiSelectedValue!) {
          String value = multiValueBuilder!(item);
          finalValue.add(value);
        }
        return finalValue.map((element) => element.toString()).join(', ');
      } else {
        return null;
      }
    } else {
      if (selectedValue != null) {
        String value = singleValueBuilder!(selectedValue as T);
        return value;
      } else {
        return null;
      }
    }
  }
}

Widget _dropDownWidget(
    {required MenuController controller,
    required double? width,
    required List<Widget> menuList,
    required String? value,
    required String? error,
    required String hintValue,
    required BoxDecoration decoration,

    Widget? textBox,
      Widget? icon,
      TextStyle? style,
      required  Function(MenuController) getController
    }) {
  double getWidth(BoxConstraints boxConstraints) {
    if (boxConstraints.maxWidth == double.infinity ||
        boxConstraints.maxWidth == double.maxFinite) {
      return 250;
    }
    return boxConstraints.maxWidth;
  }

  return LayoutBuilder(builder: (context, boxConstraints) {
    double modalWidth = width ?? getWidth(boxConstraints);
    return MenuAnchor(
      controller: controller,
      crossAxisUnconstrained: false,
      clipBehavior: Clip.hardEdge,
      style: MenuStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.white),
        maximumSize: MaterialStateProperty.resolveWith((states) {
          return Size(modalWidth, 400);
        }),
        minimumSize: MaterialStateProperty.resolveWith((states) {
          return Size(modalWidth, 10);
        }),
        padding: MaterialStateProperty.resolveWith((states) {
          return EdgeInsets.zero;
        }),
      ),
      builder: (context, controller, _) {
        getController(controller);

        return SizedBox(
          width: modalWidth,
          child: textBox ??


            InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            onTap: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            child:

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical:10),
                  decoration: decoration,
                  width: modalWidth,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextView(
                              text: value != null && value.trim().isNotEmpty
                                  ? value
                                  : hintValue,
                              style: value != null && value.trim().isNotEmpty
                                  ? style ?? 13.txtRegularBlack
                                  :  style ?? 13.txtRegularGreyText)),
                      icon ??   Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColors.greyText.withOpacity(0.7),
                      ),
                    ],
                  ),
                ),
                errorText(error)
              ],
            ),


          ),
        );
      },
      menuChildren: menuList,
    );
  });
}


Widget errorText(String? value){
  return Visibility(
      visible:value != null && value.trim().isNotEmpty,
      child: TextView(
        margin: const EdgeInsets.only(left: 32),
        text: value ?? '', style: 12.txtRegularError,));
}

