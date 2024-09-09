import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsCancel.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';

class PopUpsDeleteEntry extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddRegistration;
  const PopUpsDeleteEntry({super.key, required this.onAddRegistration});

  @override
  State<PopUpsDeleteEntry> createState() => _PopUpsDeleteEntryState();
}

class _PopUpsDeleteEntryState extends State<PopUpsDeleteEntry> {
  List<DropdownMenuItem<String>> registrationTypeData = [];
  var formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final TextEditingController _registrationType = TextEditingController();
  final TextEditingController _registrationNumber = TextEditingController();
  bool displayOnBusinessProfile = false;
  bool _isLoading = true;

  @override
  void initState() {
    _getRegistrationTypes();
    setState(() {
      _registrationType.text = '0';
    });
    super.initState();
  }

  void _getRegistrationTypes() async {
    try {
      QuerySnapshot<Map<String, dynamic>> registrationSnapshot =
          await _firestore.collection('registration_type').get();
      List<DropdownMenuItem<String>> registrationTypes = [
        const DropdownMenuItem(
          value: '',
          child: Text('-- Select --'),
        )
      ];
      for (var doc in registrationSnapshot.docs) {
        String id = doc.data()['registrationTypeId'].toString();
        String name = doc.data()['registrationType'];
        registrationTypes.add(DropdownMenuItem<String>(
          value: id,
          child: Text(name),
        ));
      }

      setState(() {
        registrationTypeData = registrationTypes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Couldn\'t fetch registration types.'),
          ),
        );
      }
    }
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });

        StoredUser? user = await getUserInfo();

        if (user == null) throw "User not found";

        var addData = {
          'registrationTypeId': int.parse(_registrationType.text),
          'registrationNumbers': int.parse(_registrationNumber.text),
          'registrationDisplay': displayOnBusinessProfile == true ? 1 : 0,
          'listingsId': int.parse(user.id),
          'dateAdded': DateTime.now(),
        };
        await _firestore.collection('registration_numbers').add(addData);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration number added successfully'),
            ),
          );
          widget.onAddRegistration(addData);

          setState(() {
            _isLoading = false;
          });
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Something went wrong. Add registration number unsuccessful, $e'),
            ),
          );
          Navigator.pop(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading == true
          ? const CircularProgressIndicator(
              color: Colors.black,
            )
          : Container(
              width: MyUtility(context).width * 0.26,
              height: MyUtility(context).height * 0.28,
              decoration: ShapeDecoration(
                color: Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MyUtility(context).width,
                    height: MyUtility(context).height * 0.06,
                    decoration: ShapeDecoration(
                      color: Color(0xFFE52F2F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.09),
                          topRight: Radius.circular(8.09),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Delete Entry',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.61,
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        CloseButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  WidgetStateProperty.all(Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MyUtility(context).width * 0.12,
                        child: Text(
                          'Are you sure you want to delete this record?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.73,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: PopUpsCancel(
                          text: 'Delete',
                          onTap: () {},
                          buttonColor: Color(0xFFE52F2F),
                        ),
                      ),
                      PopUpsCancel(
                        text: 'Cancel',
                        onTap: () {},
                        buttonColor: Color(0xFF3C4043),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
    );
  }
}
