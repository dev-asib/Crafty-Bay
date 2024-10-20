import 'package:crafty_bay/Presentation/state_holders/auth/auth_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/product_review_controller.dart';
import 'package:crafty_bay/Presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/Presentation/ui/widgets/reviews/review_card.dart';
import 'package:crafty_bay/Presentation/ui/widgets/unauthorized_warning_message.dart';
import 'package:crafty_bay/app/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  late int productID;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productID = Get.arguments['productID'];
      Get.find<ProductReviewController>().getListReviewByProductID(productID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildReviewSection(),
          _buildTotalReviewsAndAddReviewButton(),
        ],
      ),
    );
  }

  Widget _buildReviewSection() {
    return Expanded(
      child: GetBuilder<ProductReviewController>(
          builder: (productReviewController) {
        return ListView.builder(
          itemCount: productReviewController.reviewList.length,
          itemBuilder: (context, index) {
            return ReviewCard(
              review: productReviewController.reviewList[index],
            );
          },
        );
      }),
    );
  }

  Widget _buildTotalReviewsAndAddReviewButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<ProductReviewController>(
                builder: (productReviewController) {
                  return Text(
                    "Reviews (${productReviewController.reviewList.length})",
                    style: Theme.of(context).textTheme.titleMedium,
                  );
                }
              ),
            ],
          ),
          FloatingActionButton(
            onPressed: _onTapAddToReviewButton,
            child: const Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: const Text("Reviews & Ratings"),
    );
  }

  void _onTapAddToReviewButton() async {
    if (AuthController.accessToken == null) {
      unauthorizedWarningMessage(
        context: context,
        onTap: () => Get.toNamed(RoutesName.emailVerificationScreen),
      );
    } else {
      Get.toNamed(
        RoutesName.createReviewScreen,
        arguments: {
          'productID': productID,
        },
      );
    }
  }
}
