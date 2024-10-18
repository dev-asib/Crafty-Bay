import 'package:crafty_bay/Presentation/ui/widgets/info_section_title.dart';
import 'package:flutter/material.dart';

class UserInformationView extends StatefulWidget {
  const UserInformationView({super.key});

  @override
  State<UserInformationView> createState() => _UserInformationViewState();
}

class _UserInformationViewState extends State<UserInformationView> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InfoSectionHeader(title: "User Information"),
            buildInfoTitle(
              textTheme: textTheme,
              title: "Name: Dev Asib",
            ),
            buildInfoTitle(
              textTheme: textTheme,
              title: "Address: West Seowta, Manikganj",
            ),
            buildInfoTitle(
              textTheme: textTheme,
              title: "City: Manikganj",
            ),
            buildInfoTitle(
              textTheme: textTheme,
              title: "State: Manikganj Sadar",
            ),
            buildInfoTitle(
              textTheme: textTheme,
              title: "Post Code: 1800",
            ),
            buildInfoTitle(
              textTheme: textTheme,
              title: "Country: Bangladesh",
            ),
            buildInfoTitle(
              textTheme: textTheme,
              title: "Phone: 01518914064",
            ),
            buildInfoTitle(
              textTheme: textTheme,
              title: "Fax: 01518914064",
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InfoSectionHeader(title: "Shipping Information"),
            buildInfoTitle(
              textTheme: textTheme,
              title: "Name: Dev Asib",
            ),
            buildInfoTitle(
              textTheme: textTheme,
              title: "Address: West Seowta, Manikganj",
            ),
            buildInfoTitle(
              textTheme: textTheme,
              title: "City: Manikganj",
            ),
            buildInfoTitle(
              textTheme: textTheme,
              title: "State: Manikganj Sadar",
            ),
            buildInfoTitle(
              textTheme: textTheme,
              title: "Post Code: 1800",
            ),
            buildInfoTitle(
              textTheme: textTheme,
              title: "Country: Bangladesh",
            ),
            buildInfoTitle(
              textTheme: textTheme,
              title: "Phone: 01518914064",
            ),
          ],
        ),
      ],
    );
  }

  Widget buildInfoTitle({
    required TextTheme textTheme,
    required String title,
  }) {
    return Text(
      title,
      style: textTheme.titleMedium,
    );
  }
}
