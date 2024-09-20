import 'package:crafty_bay/Presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/Presentation/ui/widgets/color_picker.dart';
import 'package:crafty_bay/Presentation/ui/widgets/product_image_slider.dart';
import 'package:crafty_bay/Presentation/ui/widgets/quantity_counter.dart';
import 'package:crafty_bay/Presentation/ui/widgets/size_picker.dart';
import 'package:crafty_bay/app/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          const ProductImageSlider(),
          const SizedBox(height: 16),
          Expanded(
            child: _buildDetailsSection(),
          ),
          _buildPriceAndAddToCartSection(),
        ],
      ),
    );
  }

  Widget _buildDetailsSection() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNameAndQuantitySection(),
            const SizedBox(height: 4),
            _buildRatingAndReviewSection(),
            const SizedBox(height: 8),
            ColorPicker(
              colors: const [
                Colors.blue,
                Colors.deepPurple,
                Colors.red,
                Colors.black,
              ],
              onChangedColor: (color) {},
            ),
            const SizedBox(height: 16),
            SizePicker(
              sizes: const [
                'S',
                'M',
                'L',
                'XL',
                'XXL',
              ],
              onChangedSize: (String selectedSize) {},
            ),
            const SizedBox(height: 16),
            _buildDescriptionSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Price"),
              Text(
                "\$100",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 140,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Add To Cart"),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        const Text(
          '''Item Count Number Button is a Flutter package that allows you to easily implement a customizable item count widget with increment and decrement buttons. Item Count Number Button is a Flutter package that allows you to easily implement a customizable item count widget with increment and decrement buttons. This widget is particularly useful in scenarios where you need to manage the quantity of items, such as in a shopping cart or inventory management system.''',
          style: TextStyle(color: Colors.black45),
        ),
      ],
    );
  }

  Widget _buildNameAndQuantitySection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            "Nike show 2024 latest model - Happy new year special offer",
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        const SizedBox(width: 8),
        QuantityCounter(onIncrease: () {}, onDecrease: () {}),
      ],
    );
  }

  Widget _buildRatingAndReviewSection() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              "4.2",
              style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: _onTapReviewButton,
          child: const Text(
            "Review",
            style: TextStyle(
              color: AppColors.themeColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Card(
          color: AppColors.themeColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.favorite_outline,
              color: Colors.white,
              size: 16,
            ),
          ),
        )
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: const Text("Product Details"),
    );
  }

  void _onTapReviewButton() {
    Get.toNamed(RoutesName.reviewsScreen);
  }
}
