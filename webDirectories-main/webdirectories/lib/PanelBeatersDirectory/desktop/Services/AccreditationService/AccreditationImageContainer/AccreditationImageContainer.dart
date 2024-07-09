import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:webdirectories/myutility.dart';

import 'AccreditationImageComp/ImageBox.dart';

class AccreditationImageContainer extends StatefulWidget {
  const AccreditationImageContainer({super.key});

  @override
  State<AccreditationImageContainer> createState() =>
      _AccreditationImageContainerState();
}

class _AccreditationImageContainerState
    extends State<AccreditationImageContainer> {
  final ScrollController _scrollController = ScrollController();

  final List<List<Widget>> imageColumns = List.generate(
    4,
    (columnIndex) => List.generate(6, (rowIndex) => ImageBox()),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.42,
      height: MyUtility(context).height * 0.715,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 6, 4, 6),
        child: DraggableScrollbar.rrect(
          controller: _scrollController,
          backgroundColor: Colors.grey,
          alwaysVisibleScrollThumb: true,
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.all(4.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: imageColumns.map((column) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: column.map((image) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 6, 4, 12),
                        child: image,
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
