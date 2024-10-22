import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceProfile/ServiceQuote.dart/serviceQuoteDetails.dart';

import '../../../../../myutility.dart';
import '../../../AdminPortal/AdminProfile/ProfileComp/TextField/ProfileTextField.dart';
import '../../../AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import '../../../AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import '../../../components/descriptionDialog.dart';

class ServiceQuoteForm extends StatefulWidget {
  const ServiceQuoteForm({super.key});

  @override
  State<ServiceQuoteForm> createState() => _ServiceQuoteFormState();
}

class _ServiceQuoteFormState extends State<ServiceQuoteForm> {
  //var
  final ServiceQuoteDetails _controller = ServiceQuoteDetails();
  List<XFile> quoteItems = [];
  List<Map<String, dynamic>> galleryItems = [];
  XFile? _selectedImage;

  //Dialog for notification popup
  Future descriptionDialog(description) => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: DescriptionDialog(
          description: description,
        ));
      });
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (quoteItems.length == 12) {
        descriptionDialog("Max image amount reached ");
      } else {
        _selectedImage = image;
        quoteItems.add(_selectedImage!);
      }
    });
    print(quoteItems);
  }

  removeImage(index) {
    setState(() {
      quoteItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MyUtility(context).width * 0.8,
        height: MyUtility(context).height * 0.8,
        decoration: ShapeDecoration(
          color: Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: MyUtility(context).width,
            height: MyUtility(context).height * 0.06,
            decoration: ShapeDecoration(
              color: Color(0xFFD17226),
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
                    'Request a Quote',
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
                      foregroundColor: WidgetStateProperty.all(Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Please fill in your detail below to request a free quote for panel beating services from, [Insert Shop Name]',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.6064,
              fontFamily: 'ralewaybold',
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    width: MyUtility(context).width * 0.3,
                    height: MyUtility(context).height * 0.6,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'images/requestQuoteImage.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23.12),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 8,
              ),
              SizedBox(
                width: MyUtility(context).width * 0.45,
                height: MyUtility(context).height * 0.6,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Please note that all fields with * are compulsory',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 54, 54, 54),
                          fontSize: 16.6064,
                          fontFamily: 'ralewaybold',
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MyUtility(context).width * 0.22,
                            child: ProfileTextField(
                                controller: _controller.name,
                                headline: '*Name',
                                customColor: Colors.black),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            width: MyUtility(context).width * 0.22,
                            child: ProfileTextField(
                                controller: _controller.surname,
                                headline: '*Surname',
                                customColor: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ProfileTextField(
                          controller: _controller.email,
                          headline: '*Email Address',
                          customColor: Colors.black),
                      SizedBox(
                        height: 8,
                      ),
                      ProfileTextField(
                          controller: _controller.contact,
                          headline: '*Contact',
                          customColor: Colors.black),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MyUtility(context).width * 0.13,
                            child: ProfileTextField(
                                controller: _controller.make,
                                headline: '*Make',
                                customColor: Colors.black),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            width: MyUtility(context).width * 0.13,
                            child: ProfileTextField(
                                controller: _controller.model,
                                headline: '*Model',
                                customColor: Colors.black),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            width: MyUtility(context).width * 0.13,
                            child: ProfileTextField(
                                controller: _controller.year,
                                headline: '*Year',
                                customColor: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MyUtility(context).width * 0.25,
                            child: ProfileTextField(
                                controller: _controller.insuranceCompany,
                                headline: '*Insurance Company(if applicable)',
                                customColor: Colors.black),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            width: MyUtility(context).width * 0.15,
                            child: ProfileTextField(
                                controller: _controller.surname,
                                headline: '*VIN Number',
                                customColor: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ProfileTextField(
                          controller: _controller.message,
                          headline: '*Message',
                          customColor: Colors.black),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Attach up to 4 image of the damage',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 54, 54, 54),
                          fontSize: 18,
                          fontFamily: 'ralewaybold',
                        ),
                      ),
                      Text(
                        'Image limit: 12 images, max 2 Megabytes each. Prefer landscape format. Accepted file types: JPG, JPEG, PNG, GIF.',
                        style: TextStyle(
                          color: Color(0xFFD17226),
                          fontSize: 13.7364,
                          fontFamily: 'ralewaysemi',
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          AddButton(
                            text: 'Add Image',
                            onPressed: () {
                              _pickImage();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      quoteItems.isEmpty
                          ? const Center(
                              child: Text(
                                'No images found',
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          : Wrap(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.start,
                              children: [
                                for (var i = 0; i < quoteItems.length; i++)
                                  QuoteImageStyle(quoteItems[i].path, i),
                              ],
                            ),

                      /*
                            ListView.builder(
                              itemCount: quoteItems.length,
                              itemBuilder: (context, index) {
                                final media = quoteItems[index];
                                print(media);
                                return Image.network(
                                  media.path,
                                  width: 25,
                                  height: 25,
                                );
                              }),
                             */
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AddButton(
                            text: 'Send',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ]));
  }

  Widget QuoteImageStyle(imagePath, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
            fit: BoxFit.cover,
            imagePath,
            width: 100,
            height: 100,
          ),
          SizedBox(
            height: 8,
          ),
          AddButton(
            text: 'remove',
            onPressed: () {
              removeImage(index);
            },
          ),
        ],
      ),
    );
  }
}
