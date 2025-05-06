import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/watif_navbar.dart';

class WatifContact extends StatefulWidget {
  const WatifContact({Key? key}) : super(key: key);

  @override
  State<WatifContact> createState() => _WatifContactState();
}

class _WatifContactState extends State<WatifContact> {
  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Form field controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  // Recaptcha state
  bool _isRecaptchaChecked = false;
  RecaptchaState _recaptchaState = RecaptchaState.initial;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.05;
    final double verticalPadding = screenSize.height * 0.02;

    // Calculate responsive sizes
    final double titleFontSize = screenSize.width * 0.06;
    final double subtitleFontSize = screenSize.width * 0.035;
    final double sectionTitleFontSize = screenSize.width * 0.04;
    final double bodyTextFontSize = screenSize.width * 0.035;
    final double iconSize = screenSize.width * 0.05;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/watif_logo.png',
                height: screenSize.height * 0.04,
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
              ),
              Text(
                'Drive Smarter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: subtitleFontSize,
                ),
              ),
            ],
          ),
        ),
        titleSpacing: 16,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: screenSize.width * 0.08,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: const WatifNavbar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF01070B),
              Color.fromARGB(255, 1, 37, 61),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Contact information section
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(horizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Get in touch',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: verticalPadding),
                        Center(
                          child: Text(
                            'Have questions? We\'re here to help!\nReach out to our team via email at\nhello@webdirectories.co.za or fill\nout the contact form below. We look\nforward to connecting with you!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: subtitleFontSize,
                            ),
                          ),
                        ),
                        SizedBox(height: verticalPadding * 2),

                        // Business Hours
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: const Color(0xFF6ECDF8),
                              size: iconSize,
                            ),
                            SizedBox(width: horizontalPadding / 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Business Hours',
                                  style: TextStyle(
                                    color: const Color(0xFF6ECDF8),
                                    fontSize: sectionTitleFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: verticalPadding / 2),
                                Text(
                                  'Mon-Fri | 08:00AM – 5:00PM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: bodyTextFontSize,
                                  ),
                                ),
                                Text(
                                  'Sat-Sun & Public Holidays | Closed',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: bodyTextFontSize,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: verticalPadding * 1.5),

                        // Contact Us
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: const Color(0xFF6ECDF8),
                              size: iconSize,
                            ),
                            SizedBox(width: horizontalPadding / 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Contact Us',
                                  style: TextStyle(
                                    color: const Color(0xFF6ECDF8),
                                    fontSize: sectionTitleFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: verticalPadding / 2),
                                Text(
                                  '(+27) 12 403 1020',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: bodyTextFontSize,
                                  ),
                                ),
                                Text(
                                  '(+27) 12 346 4690',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: bodyTextFontSize,
                                  ),
                                ),
                                Text(
                                  'info@webdirectories.co.za',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: bodyTextFontSize,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: verticalPadding * 1.5),

                        // Address
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: const Color(0xFF6ECDF8),
                              size: iconSize,
                            ),
                            SizedBox(width: horizontalPadding / 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Address',
                                  style: TextStyle(
                                    color: const Color(0xFF6ECDF8),
                                    fontSize: sectionTitleFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: verticalPadding / 2),
                                Text(
                                  '63 Bokmakierie Street, Eden,\nGeorge, 6529, Western Cape,\nSouth Africa',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: bodyTextFontSize,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Google Maps placeholder
                Container(
                  width: double.infinity,
                  height: screenSize.height * 0.2,
                  color: Colors.grey.shade300,
                  child: Center(
                    child: Text(
                      'GOOGLE MAPS',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Contact form section
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF011627),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(horizontalPadding),
                    child: Column(
                      children: [
                        Text(
                          'Message us',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: verticalPadding / 2),
                        Text(
                          '*Please fill in required fields below',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: bodyTextFontSize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: verticalPadding),

                        // White form container
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(horizontalPadding),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                // Form fields
                                _buildFormField(
                                  label: 'First Name*',
                                  controller: _firstNameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your first name';
                                    }
                                    return null;
                                  },
                                ),
                                Divider(height: 1, color: Colors.grey.shade300),

                                _buildFormField(
                                  label: 'Last Name*',
                                  controller: _lastNameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your last name';
                                    }
                                    return null;
                                  },
                                ),
                                Divider(height: 1, color: Colors.grey.shade300),

                                _buildFormField(
                                  label: 'Email*',
                                  controller: _emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    if (!RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                Divider(height: 1, color: Colors.grey.shade300),

                                _buildFormField(
                                  label: 'Phone*',
                                  controller: _phoneController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number';
                                    }
                                    return null;
                                  },
                                ),
                                Divider(height: 1, color: Colors.grey.shade300),

                                _buildFormField(
                                  label: 'Message*',
                                  controller: _messageController,
                                  maxLines: 4,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your message';
                                    }
                                    return null;
                                  },
                                ),
                                Divider(height: 1, color: Colors.grey.shade300),

                                // Recaptcha
                                Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: Row(
                                    children: [
                                      _buildRecaptchaCheckbox(),
                                      const SizedBox(width: 8),
                                      const Text(
                                        "I'm not a robot",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            'images/recaptcha.png',
                                            height: 50,
                                            width: 50,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                height: 50,
                                                width: 50,
                                                color: Colors.grey.shade100,
                                                child: const Center(
                                                  child: Text(
                                                    'reCAPTCHA',
                                                    style:
                                                        TextStyle(fontSize: 8),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: verticalPadding),

                                // Submit button
                                Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate() &&
                                          _isRecaptchaChecked) {
                                        // Form is valid and reCAPTCHA is checked
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Form submitted successfully!'),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                      } else if (!_isRecaptchaChecked) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Please complete the reCAPTCHA verification'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF011F33),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: horizontalPadding * 1.2,
                                        vertical: verticalPadding * 0.8,
                                      ),
                                    ),
                                    child: Text(
                                      'Submit Now',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: bodyTextFontSize,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: verticalPadding * 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: const InputDecoration(
            filled: false,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 4,
            ),
            isDense: true,
          ),
          validator: validator,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  // Build the recaptcha checkbox with different states
  Widget _buildRecaptchaCheckbox() {
    switch (_recaptchaState) {
      case RecaptchaState.success:
        return SizedBox(
          width: 32,
          height: 32,
          child: CustomPaint(
            size: const Size(32, 32),
            painter: CheckmarkPainter(),
          ),
        );
      case RecaptchaState.loading:
        return SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            strokeWidth: 2,
          ),
        );
      case RecaptchaState.error:
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.red.shade300, width: 2),
          ),
          child: Checkbox(
            value: false,
            onChanged: (_) => _verifyRecaptcha(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            side: BorderSide(color: Colors.red.shade300),
          ),
        );
      case RecaptchaState.initial:
      default:
        return SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: _isRecaptchaChecked,
            onChanged: (_) => _verifyRecaptcha(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            side: BorderSide(color: Colors.grey.shade400),
          ),
        );
    }
  }

  // Simulate verification process
  void _verifyRecaptcha() {
    setState(() {
      _recaptchaState = RecaptchaState.loading;
    });

    // Simulate a delay for the loading state
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isRecaptchaChecked = true;
        _recaptchaState = RecaptchaState.success;
      });
    });
  }
}

// Enum to track the recaptcha state
enum RecaptchaState {
  initial,
  loading,
  success,
  error,
}

// Custom painter for the checkmark that looks exactly like in the image
class CheckmarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4CAF50) // Brighter green color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.55);
    path.lineTo(size.width * 0.4, size.height * 0.75);
    path.lineTo(size.width * 0.8, size.height * 0.25);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
