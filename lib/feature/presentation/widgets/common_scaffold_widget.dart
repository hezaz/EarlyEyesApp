import 'package:early_eyes/components/coreComponents/common_app_bar.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';

import '../../../components/coreComponents/TextView.dart';
import '../../../components/styles/appColors.dart';
import '../../../components/styles/appImages.dart';
import 'common_drawer.dart';

class CommonScaffold extends StatelessWidget implements PreferredSizeWidget{
  CommonScaffold(
      {super.key,
      this.title,
      this.body,
      this.resizeToAvoidBottomInset,
      this.floatingActionBtn,this.actions,
        this.height,this.leading,
        this.onBackTap,this.hasDrawer=false,this.btnLocation});

  Widget? body;
  String? title;
  Widget? floatingActionBtn;
  bool? resizeToAvoidBottomInset;
  final List<Widget>? actions;
  final double? height;
  VoidCallback? onBackTap;
  final bool hasDrawer;
  final Widget? leading;
  FloatingActionButtonLocation? btnLocation;


  @override
  @override
  // Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
  Size get preferredSize => Size.fromHeight(height ?? 70);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: btnLocation ?? FloatingActionButtonLocation.centerFloat,

      resizeToAvoidBottomInset:resizeToAvoidBottomInset ,
      floatingActionButton: floatingActionBtn,
      appBar: AppBar(
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          actions: actions,
          automaticallyImplyLeading: false,
          //leading: isDrawerVisible ? SizedBox() : null,
          leading: hasDrawer
              ? Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu,
                  size: 30, color: AppColors.primaryBlue),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          )
              : leading ??
              IconButton(
                  onPressed: onBackTap,
                  icon: Image.asset(
                    AppImages.backBtn,
                    height: 24,
                  )),
          title: TextView(text: title ?? "", style: 20.txtSBoldPBlueText)),
      // appBar: CommonAppBar(
      //   actions: actions,
      //   title: title ?? '',
      // ),
      drawer: CommonDrawer(),
      backgroundColor: Colors.white,
      body: body,
    );
  }
}
