import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationsComp/icons/NotificationDelete.dart';
import 'package:webdirectories/myutility.dart';

import '../NotificationsComp/icons/LabelImportant.dart';
import '../NotificationsComp/icons/NotificationLetter.dart';
import '../NotificationsComp/icons/NotificationSelect.dart';
import '../NotificationsComp/icons/NotificationStar.dart';
import '../NotificationsComp/icons/NotificationTimeIcon.dart';

class Documentexpiredcontainer extends StatefulWidget {
  final String notificationTitle;
  final String year;
  final String month;
  final String day;

  const Documentexpiredcontainer({
    super.key,
    required this.notificationTitle,
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  State<Documentexpiredcontainer> createState() =>
      _DocumentexpiredcontainerState();
}

class _DocumentexpiredcontainerState extends State<Documentexpiredcontainer> {
  bool _isTextBold = false;
  bool _isSelected = false; // Track whether the notification is selected

  void _handleStarChanged(bool isStarred) {
    setState(() {
      _isTextBold = isStarred;
    });
  }

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection, // Toggle selection on tap
      child: Container(
        height: MyUtility(context).height * 0.05,
        decoration: BoxDecoration(
          color: _isSelected ? Color(0xFFEF9040) : Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.5400000214576721),
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MyUtility(context).width * 0.59,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        NotificationSelect(
                          boxColor:
                              _isSelected ? Colors.white : Color(0xFF757575),
                        ),
                        NotificationStar(
                          onStarChanged: _handleStarChanged,
                          iconColor:
                              _isSelected ? Colors.white : Color(0xFF757575),
                          iconColorChange:
                              _isSelected ? Colors.white : Color(0xFFEF9040),
                        ),
                        LabelImportant(
                          iconColorChange:
                              _isSelected ? Colors.white : Color(0xFFEF9040),
                          iconColor:
                              _isSelected ? Colors.white : Color(0xFF757575),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Row(
                      children: [
                        Text(
                          'Tata Approval ',
                          style: TextStyle(
                            color:
                                _isSelected ? Colors.white : Color(0xFF202124),
                            fontSize: 14.54,
                            fontFamily: 'ralewaybold',
                          ),
                        ),
                        Text(
                          'Please Update',
                          style: TextStyle(
                            color:
                                _isSelected ? Colors.white : Color(0xFF202124),
                            fontSize: 14.54,
                            fontFamily: 'raleway',
                          ),
                        ),
                        /*Text(
                          widget.notificationTitle,
                          style: TextStyle(
                            color:
                                _isSelected ? Colors.white : Color(0xFF202124),
                            fontSize: 14.54,
                            fontFamily: 'raleway',
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: _isSelected
                  ? Row(
                      children: [
                        SizedBox(
                          width: MyUtility(context).width * 0.061,
                        ),
                        NotificationDelete(iconColor: Colors.white),
                        NotificationLetter(
                          iconColor: Colors.white,
                          onPress: () {},
                        ),
                        NotificationTimeIcon(iconColor: Colors.white),
                      ],
                    )
                  : SizedBox(
                      child: Row(
                        children: [
                          SizedBox(
                              height: 30,
                              child: AddButton(
                                  text: 'update Now', onPressed: () {})),
                          Text(
                            '${widget.day}/${widget.month}/${widget.year}',
                            style: TextStyle(
                              color: Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily: 'raleway',
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
