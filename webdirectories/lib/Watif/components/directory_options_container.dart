import 'package:flutter/material.dart';

class DirectoryOption {
  final String title;
  final IconData? icon;
  final VoidCallback onTap;

  DirectoryOption({
    required this.title,
    this.icon,
    required this.onTap,
  });
}

class DirectoryOptionsContainer extends StatelessWidget {
  final String title;
  final List<DirectoryOption> options;
  final double? currentPage;
  final int totalPages;
  final VoidCallback? onNextPage;
  final VoidCallback? onPreviousPage;

  const DirectoryOptionsContainer({
    Key? key,
    required this.title,
    required this.options,
    this.currentPage,
    this.totalPages = 1,
    this.onNextPage,
    this.onPreviousPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double containerPadding = screenSize.width * 0.05;
    final double buttonHeight = screenSize.height * 0.068;
    final double titleFontSize = screenSize.width * 0.08;
    final double pageIndicatorSize = screenSize.width * 0.05;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF333333).withOpacity(0.7),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      padding: EdgeInsets.only(
        top: containerPadding,
        left: containerPadding,
        right: containerPadding,
        bottom: screenSize.height * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Page indicator if needed
          if (totalPages > 1 && currentPage != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Previous page button
                  GestureDetector(
                    onTap: onPreviousPage,
                    child: Container(
                      width: pageIndicatorSize,
                      height: pageIndicatorSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 12,
                      ),
                    ),
                  ),

                  // Page counter
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.03),
                    child: Text(
                      "${currentPage?.toInt() ?? 1}/$totalPages",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenSize.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Next page button
                  GestureDetector(
                    onTap: onNextPage,
                    child: Container(
                      width: pageIndicatorSize,
                      height: pageIndicatorSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // Title
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // Options
          ...options
              .map((option) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildOptionButton(
                      option: option,
                      height: buttonHeight,
                      context: context,
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildOptionButton({
    required DirectoryOption option,
    required double height,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: option.onTap,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFF2E6C39),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side with title
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  option.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Right side with icon
            Container(
              width: height * 0.9,
              height: height * 0.9,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                option.icon ?? Icons.chevron_right,
                color: const Color(0xFF2E6C39),
                size: height * 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
