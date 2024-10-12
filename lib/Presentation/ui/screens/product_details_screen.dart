import 'package:crafty_bay/Presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/Presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/Presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/Presentation/ui/utils/notification_utils.dart';
import 'package:crafty_bay/Presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/Presentation/ui/widgets/product_image_slider.dart';
import 'package:crafty_bay/Presentation/ui/widgets/quantity_counter.dart';
import 'package:crafty_bay/Presentation/ui/widgets/size_picker.dart';
import 'package:crafty_bay/app/routes/routes_name.dart';
import 'package:crafty_bay/data/models/product_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  late int productID;
  String _selectedColor = '';
  String _selectedSize = '';
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    productID = Get.arguments['productID'];
    Get.find<ProductDetailsController>().getProductDetailsById(productID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.inProgress) {
          return const CenteredCircularProgressIndicator();
        }

        if (productDetailsController.errorMessage != null) {
          return Center(
            child: Text(productDetailsController.errorMessage!),
          );
        }

        return Column(
          children: [
            Expanded(
              child: _buildDetailsSection(
                  productDetailsController.productDetailsModel!),
            ),
            _buildPriceAndAddToCartSection(
                productDetailsController.productDetailsModel!),
          ],
        );
      }),
    );
  }

  Widget _buildDetailsSection(ProductDetailsModel productDetailsModel) {

    List<String> sizes = productDetailsModel.size!.split(',');
    List<String> colors = productDetailsModel.color!.split(',');
    _selectedSize = sizes.first;
    _selectedColor = colors.first;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageSlider(
              sliderUrls: [
                productDetailsModel.img1!,
                productDetailsModel.img2!,
                productDetailsModel.img3!,
                productDetailsModel.img4!,
              ],
            ),
            const SizedBox(height: 16),
            _buildNameAndQuantitySection(productDetailsModel),
            const SizedBox(height: 4),
            _buildRatingAndReviewSection(productDetailsModel),
            const SizedBox(height: 8),
            SizePicker(
              sizes: colors,
              onChangedSize: (String selectedColor) {
                _selectedColor = selectedColor;
              },
            ),

            const SizedBox(height: 16),
            SizePicker(
              sizes: sizes,
              onChangedSize: (String selectedSize) {
                _selectedSize = selectedSize;
              },
            ),
            const SizedBox(height: 16),
            _buildDescriptionSection(productDetailsModel),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection(
      ProductDetailsModel productDetailsModel) {
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
              const Text("Price"),
              Text(
                "\$${productDetailsModel.product?.price ?? ''}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          _buildAddToCartButton()
        ],
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return SizedBox(
      width: 140,
      child: GetBuilder<AddToCartController>(builder: (addToCartController) {
        return Visibility(
          visible: !addToCartController.inProgress,
          replacement: const CenteredCircularProgressIndicator(),
          child: ElevatedButton(
            onPressed: _onTapAddToCart,
            child: const Text("Add To Cart"),
          ),
        );
      }),
    );
  }

  Widget _buildDescriptionSection(ProductDetailsModel productDetailsModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Text(
          productDetailsModel.product?.shortDes ?? '',
          style: const TextStyle(color: Colors.black45),
        ),
      ],
    );
  }

  Widget _buildNameAndQuantitySection(ProductDetailsModel productDetailsModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            productDetailsModel.product?.title ?? '',
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        const SizedBox(width: 8),
        GetBuilder<ProductDetailsController>(
            builder: (productDetailsController) {
          return QuantityCounter(
            quantity: _quantity,
            onIncrease: () {
              _quantity++;
              setState(() {});
            },
            onDecrease: () {
              if (1 < _quantity) {
                _quantity--;
                setState(() {});
              }
            },
          );
        }),
      ],
    );
  }

  Widget _buildRatingAndReviewSection(ProductDetailsModel productDetailsModel) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              "${productDetailsModel.product?.star ?? ''}",
              style: const TextStyle(
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

  Future<void> _onTapAddToCart() async {
    bool isLoggedInUser = Get.find<AuthController>().isLoginUser();

    if (isLoggedInUser) {
      AuthController.accessToken;
      bool result = await Get.find<AddToCartController>().addToCart(
        productID: productID,
        color: _selectedColor,
        size: _selectedSize,
        quantity: _quantity,
      );
      if (result) {
        if (mounted) {
          NotificationUtils.flushBarNotification(
            context: context,
            title: "Congratulations",
            message: "Added to cart",
          );
        }
      } else {
        if (mounted) {
          NotificationUtils.flushBarNotification(
            context: context,
            title: "Waning!",
            message: Get.find<AddToCartController>().errorMessage!,
            backgroundColor: AppColors.redColor,
          );
        }
      }
    } else {
      Get.toNamed(RoutesName.emailVerificationScreen);
    }
  }

  void _onTapReviewButton() {
    Get.toNamed(RoutesName.reviewsScreen);
  }
}
