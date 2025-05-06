import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/components/directory_top_bar.dart';
import 'package:webdirectories/Watif/components/directory_options_container.dart';
import 'package:webdirectories/Watif/watif_routes.dart';
import 'package:webdirectories/Watif/watif_navbar.dart';

class FuelDirectory extends StatefulWidget {
  const FuelDirectory({Key? key}) : super(key: key);

  @override
  State<FuelDirectory> createState() => _FuelDirectoryState();
}

class _FuelDirectoryState extends State<FuelDirectory> {
  final PageController _pageController = PageController(initialPage: 0);
  double _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page != null) {
        setState(() {
          _currentPage = _pageController.page! + 1;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleNextPage() {
    if (_pageController.page! < 5) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handlePreviousPage() {
    if (_pageController.page! > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Option button actions
  void _navigateToNearestFuel() {
    print("Navigating to Nearest Fuel");
    // Implementation to be added
  }

  void _navigateToCheapestFuel() {
    print("Navigating to Cheapest Fuel");
    // Implementation to be added
  }

  void _navigateToSearchFuelBrands() {
    print("Navigating to Search Fuel Brands");
    // Implementation to be added
  }

  void _navigateToFuelPricePerArea() {
    print("Navigating to Fuel Price Per Area");
    // Implementation to be added
  }

  void _navigateToMoreFuelOptions() {
    print("Navigating to More Fuel Options");
    // Implementation to be added
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final Size screenSize = MediaQuery.of(context).size;

    // Set the route name for navigation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ModalRoute.of(context)?.settings.name == null) {
        Navigator.of(context).pushReplacementNamed(WatifRoutes.home);
      }
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      endDrawer: const WatifNavbar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fuel_background.png'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top bar
              const DirectoryTopBar(
                title: 'Fuel & Pricing',
                iconPath: 'images/fuel_icon.png',
                startColor: Color(0xFF2D6E35), // Darker green
                endColor: Color(0xFF45A94E), // Lighter green
                mainTitle: 'fuel',
                subTitle: 'directory',
              ),

              // Spacer
              const Spacer(),

              // Options container
              DirectoryOptionsContainer(
                title: 'Fuel & Pricing',
                currentPage: _currentPage,
                totalPages: 6,
                onNextPage: _handleNextPage,
                onPreviousPage: _handlePreviousPage,
                options: [
                  DirectoryOption(
                    title: 'Nearest Fuel',
                    icon: Icons.arrow_forward_ios,
                    onTap: _navigateToNearestFuel,
                  ),
                  DirectoryOption(
                    title: 'Cheapest Fuel',
                    icon: Icons.arrow_forward_ios,
                    onTap: _navigateToCheapestFuel,
                  ),
                  DirectoryOption(
                    title: 'Search Fuel Brands',
                    icon: Icons.arrow_forward_ios,
                    onTap: _navigateToSearchFuelBrands,
                  ),
                  DirectoryOption(
                    title: 'Fuel Price Per Area',
                    icon: Icons.arrow_forward_ios,
                    onTap: _navigateToFuelPricePerArea,
                  ),
                  DirectoryOption(
                    title: 'More Fuel Options',
                    icon: Icons.arrow_forward_ios,
                    onTap: _navigateToMoreFuelOptions,
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
