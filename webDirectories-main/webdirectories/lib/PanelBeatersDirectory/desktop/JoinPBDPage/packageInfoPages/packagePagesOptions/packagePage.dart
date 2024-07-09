import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/packageInfoPages/packagePagesOptions/corePackagePage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/packageInfoPages/packagePagesOptions/premiumPackagePage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/packageInfoPages/packagePagesOptions/premiumPlusPackagePage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/packageInfoPages/packagePagesOptions/starterPackagePage.dart';

class PackagePage extends StatefulWidget {
  String packageType;
  PackagePage({super.key, required this.packageType});

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.packageType == "Starter") StarterPackagePage(),
        if (widget.packageType == "Core") CorePackagePage(),
        if (widget.packageType == "Premium") PremiumPackagePage(),
        if (widget.packageType == "PremiumPlus") PremiumPlusPackagePage(),
      ],
    );
  }
}
