import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/appBar2.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:flutter/material.dart';

class PaymentHistory extends StatelessWidget {
  final List<Map<String, dynamic>> paymentHistory = [
    {
      'orderId': '#12436',
      'childName': 'Hedi',
      'course': 'Python',
      'amount': '₹3700',
      'date': 'Fri, 24',
      'status': 'Success',
      'month': 'May, 2024'
    },
    {
      'orderId': '#12436',
      'childName': 'Yanis',
      'course': 'Python',
      'amount': '₹3700',
      'date': 'Fri, 24',
      'status': 'Success',
      'month': 'May, 2024'
    },
    {
      'orderId': '#12436',
      'childName': 'Hedi',
      'course': 'Python',
      'amount': '₹3700',
      'date': 'Fri, 24',
      'status': 'Success',
      'month': 'April, 2024'
    },
    {
      'orderId': '#12436',
      'childName': 'Hedi',
      'course': 'Python',
      'amount': '₹3700',
      'date': 'Fri, 24',
      'status': 'Success',
      'month': 'April, 2024'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('Payment history'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          _buildFilters(),
          Expanded(
            child: ListView.builder(
              itemCount: paymentHistory.length,
              itemBuilder: (context, index) {
                final payment = paymentHistory[index];
                final isNewMonth = index == 0 || paymentHistory[index - 1]['month'] != payment['month'];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isNewMonth) Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Text(
                        payment['month'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    PaymentCard(
                      orderId: payment['orderId'],
                      childName: payment['childName'],
                      course: payment['course'],
                      amount: payment['amount'],
                      date: payment['date'],
                      status: payment['status'],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildFilterButton('All', true),
          _buildFilterButton('Complete', false),
          _buildFilterButton('Rejected', false),
        ],
      ),
    );
  }

  // Filter Button widget
  Widget _buildFilterButton(String title, bool isSelected) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        backgroundColor: isSelected ? Colors.white : Colors.white,
        side: BorderSide(
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  final String orderId;
  final String childName;
  final String course;
  final String amount;
  final String date;
  final String status;

  const PaymentCard({
    Key? key,
    required this.orderId,
    required this.childName,
    required this.course,
    required this.amount,
    required this.date,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: status == 'Success' ? AppColors.white : Colors.grey),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order ID $orderId',
                      style:
                     12.txtRegularGreyHint
                    ),
                    const SizedBox(height: 4),
                    TextView(text: "Child Name $childName",style: 12.txtRegularBlack,margin: EdgeInsets.only(top: 5),),
                    TextView(text: "Course $course",style: 12.txtRegularBlack,margin: EdgeInsets.only(top: 5)),
                    TextView(text: "Amount $amount",style: 12.txtRegularBlack,margin: EdgeInsets.only(top: 5)),

                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: 12.txtRegularGreyHint
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.receipt_long_outlined,
                      size: 24,
                      color: AppColors.greyHint,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    status,
                    style: TextStyle(
                      color: status == 'Success' ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
