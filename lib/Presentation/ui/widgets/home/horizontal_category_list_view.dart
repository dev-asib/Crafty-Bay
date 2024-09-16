import 'package:crafty_bay/Presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';

class HorizontalCategoryListView extends StatelessWidget {
  const HorizontalCategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CategoryCard(
          iconData: Icons.computer,
          label: "Electronics",
        );
      },
      separatorBuilder: (_, __) {
        return const SizedBox(width: 8);
      },
    );
  }
}
