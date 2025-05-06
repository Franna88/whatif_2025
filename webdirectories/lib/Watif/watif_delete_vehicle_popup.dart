import 'package:flutter/material.dart';

class DeleteVehicleConfirmation extends StatelessWidget {
  final String vehicleName;
  final VoidCallback onDelete;
  final VoidCallback onCancel;

  const DeleteVehicleConfirmation({
    Key? key,
    required this.vehicleName,
    required this.onDelete,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: const Color(0xFFDCDCDC),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with title and close button
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFD14542),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.04,
              vertical: screenSize.height * 0.015,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Delete Vehicle',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: onCancel,
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),

          // Dialog content
          Padding(
            padding: EdgeInsets.all(screenSize.width * 0.06),
            child: Column(
              children: [
                Text(
                  'Are you sure you want to delete this vehicle? You will have to reinsert all your info again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenSize.width * 0.045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),

                // Action buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Delete button
                    ElevatedButton(
                      onPressed: onDelete,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD14542),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.08,
                          vertical: screenSize.height * 0.012,
                        ),
                      ),
                      child: const Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.04),

                    // Cancel button
                    ElevatedButton(
                      onPressed: onCancel,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4B5054),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.08,
                          vertical: screenSize.height * 0.012,
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Function to show the delete confirmation dialog
Future<bool> showDeleteVehicleConfirmation(
  BuildContext context,
  String vehicleName,
) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return DeleteVehicleConfirmation(
        vehicleName: vehicleName,
        onDelete: () {
          Navigator.of(context).pop(true); // Return true if delete is confirmed
        },
        onCancel: () {
          Navigator.of(context).pop(false); // Return false if canceled
        },
      );
    },
  );

  return result ?? false; // Default to false if dialog is dismissed
}
