import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/pages/student/all_student_card.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/cupertino.dart';

class ViewAllStudentScreen extends StatelessWidget {
  const ViewAllStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: AppStrings.students,
      onBackTap: (){
        context.pop();
      },
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),

        children: [
          TextView(

            text: AppStrings.totalStudent,style: 14.txtBoldDarkBlue,
          ),
          AllStudentCard(),
        ],
      ),
    );
  }
}
