import 'package:early_eyes/components/coreComponents/AppButton.dart';
import 'package:early_eyes/components/coreComponents/ImageView.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/appImages.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';

class Buydetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white  ,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(AppStrings.buydetails,
        style: 20.txtMediumBlue,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ImageView(url: AppImages.backBtn,size: 25,),
        )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(AppImages.buydetail),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Course Title
              Text(
                'Course Title',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Python Programming Workshop',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16),

              // Description
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Python programming is the practice of writing code in Python, a versatile and powerful high-level programming language known for its readability and ease of use. Python is widely used in various fields such as web development, data science, artificial intelligence, automation, and more.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),

              // Objective
              Text(
                'Objective',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'To provide children with a foundational understanding of Python programming, enabling them to develop problem-solving skills, foster creativity, and gain confidence in coding through engaging and interactive learning experiences.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 24),

              // Payment Summary
              Text(
                'Payment summary',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              // Payment Details
              PaymentDetailRow(label: 'Total', amount: '3700,00 €'),
              PaymentDetailRow(label: 'Tax', amount: '100,00 €'),
              PaymentDetailRow(label: 'Platform Fee', amount: '20,00 €'),
              Divider(),
              PaymentDetailRow(label: 'Grand Total', amount: '3820,00 €', isBold: true),

              SizedBox(height: 24),


              Center(
                child:
                    SafeArea(
                      child: AppButton(
                        buttonColor: AppColors.primaryBlue,
                        label: AppStrings.paymentmethod,
                        radius: 30,
                        ),
                    )
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentDetailRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isBold;

  const PaymentDetailRow({
    Key? key,
    required this.label,
    required this.amount,
    this.isBold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
