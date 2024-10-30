import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationsComp/icons/NotificationDelete.dart';
import 'package:webdirectories/myutility.dart';

import 'icons/LabelImportant.dart';
import 'icons/NotificationLetter.dart';
import 'icons/NotificationSelect.dart';
import 'icons/NotificationStar.dart';
import 'icons/NotificationTimeIcon.dart';

class NotificationTitleAlt extends StatefulWidget {
  final bool read;
  final String notificationTitle;
  final String year;
  final String month;
  final String day;
  final String personInterested;
  final String make;
  final String type;
  final double? rate;
  final String? message;
  final VoidCallback onPress;

  const NotificationTitleAlt(
      {super.key,
      required this.read,
      required this.notificationTitle,
      required this.year,
      required this.month,
      required this.day,
      required this.personInterested,
      required this.make,
      required this.type,
      this.rate,
      this.message,
      required this.onPress});

  @override
  State<NotificationTitleAlt> createState() => _NotificationTitleAltState();
}

class _NotificationTitleAltState extends State<NotificationTitleAlt> {
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
            if (widget.type == "Documents")
              SizedBox(
                  child: Row(children: [
                Expanded(
                    flex: 7,
                    child: Row(children: [
                      Text(
                        widget.make,
                        style: TextStyle(
                          color: _isSelected ? Colors.white : Color(0xFF202124),
                          fontSize: 14.54,
                          fontFamily: 'ralewaybold',
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Please Update",
                        style: TextStyle(
                          color: _isSelected ? Colors.white : Color(0xFF202124),
                          fontSize: 14.54,
                          fontFamily: 'ralewaybold',
                        ),
                      ),
                    ]))
              ])),
            if (widget.type == "Reviews")
              SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Row(
                        children: [
                          Text(
                            widget.rate == 1
                                ? 'Angry | '
                                : widget.rate! < 3
                                    ? 'Good | '
                                    : 'Great |',
                            style: TextStyle(
                              color: _isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily: 'ralewaybold',
                            ),
                          ),
                          Text(
                            '${widget.personInterested} | ',
                            style: TextStyle(
                              color: _isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily: 'raleway',
                            ),
                          ),
                          Text(
                            widget.notificationTitle,
                            style: TextStyle(
                              color: _isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily: 'ralewaybold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            if (widget.type == "Quote")
              SizedBox(
                width: MyUtility(context).width * 0.65,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
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
                          Text(
                            widget.personInterested,
                            style: TextStyle(
                              color: _isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily:
                                  _isTextBold ? 'ralewaybold' : 'raleway',
                            ),
                          ),
                          Text(
                            widget.notificationTitle,
                            style: TextStyle(
                              color: _isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily: 'ralewaybold',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Text(
                            'Make -   ',
                            style: TextStyle(
                              color: _isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily:
                                  widget.read ? 'raleway' : 'ralewaybold',
                            ),
                          ),
                          Text(
                            widget.make,
                            style: TextStyle(
                              color: _isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily: 'raleway',
                            ),
                          ),
                          Text(
                            " ${widget.message!}",
                            style: TextStyle(
                              color: _isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily:
                                  widget.read ? 'raleway' : 'ralewaybold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              flex: 2,
              child: _isSelected
                  ? Row(
                      children: [
                        NotificationDelete(iconColor: Colors.white),
                        NotificationLetter(
                          iconColor: Colors.white,
                          onPress: widget.onPress,
                        ),
                        NotificationTimeIcon(iconColor: Colors.white),
                      ],
                    )
                  : Text(
                      '${widget.day}/${widget.month}/${widget.year}',
                      style: TextStyle(
                        color: Color(0xFF202124),
                        fontSize: 14.54,
                        fontFamily: 'raleway',
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
