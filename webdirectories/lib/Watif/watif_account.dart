import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/watif_navbar.dart';

class WatifAccount extends StatefulWidget {
  const WatifAccount({Key? key}) : super(key: key);

  @override
  State<WatifAccount> createState() => _WatifAccountState();
}

class _WatifAccountState extends State<WatifAccount> {
  // Controllers for text fields
  final TextEditingController _nameController =
      TextEditingController(text: 'Thys');
  final TextEditingController _surnameController =
      TextEditingController(text: 'Cronje');
  final TextEditingController _nicknameController =
      TextEditingController(text: 'TCronje');
  final TextEditingController _emailController =
      TextEditingController(text: 'thys@webdirectories.co.za');
  final TextEditingController _phoneController =
      TextEditingController(text: '+27713371635');
  final TextEditingController _idNumberController =
      TextEditingController(text: '9702130176082');
  final TextEditingController _dobController =
      TextEditingController(text: '13/02/1997');

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _nicknameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _idNumberController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.08;
    final double verticalPadding = screenSize.height * 0.02;

    // Calculate responsive sizes
    final double titleFontSize = screenSize.width * 0.07;
    final double subtitleFontSize = screenSize.width * 0.035;
    final double labelFontSize = screenSize.width * 0.04;
    final double textFieldHeight = screenSize.height * 0.06;

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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: verticalPadding * 2),
                  Center(
                    child: Text(
                      'My Account',
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
                      'Manage your account-level settings\nand login credentials here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: subtitleFontSize,
                      ),
                    ),
                  ),
                  SizedBox(height: verticalPadding * 2),

                  // Form fields
                  _buildInputField('Name*', _nameController, screenSize,
                      labelFontSize, textFieldHeight),
                  SizedBox(height: verticalPadding),

                  _buildInputField('Surname*', _surnameController, screenSize,
                      labelFontSize, textFieldHeight),
                  SizedBox(height: verticalPadding),

                  _buildInputField('Nickname*', _nicknameController, screenSize,
                      labelFontSize, textFieldHeight),
                  SizedBox(height: verticalPadding),

                  _buildInputField('Email*', _emailController, screenSize,
                      labelFontSize, textFieldHeight),
                  SizedBox(height: verticalPadding),

                  _buildInputField('Phone Number*', _phoneController,
                      screenSize, labelFontSize, textFieldHeight),
                  SizedBox(height: verticalPadding),

                  _buildInputField('ID Number', _idNumberController, screenSize,
                      labelFontSize, textFieldHeight),
                  SizedBox(height: verticalPadding),

                  _buildInputField('Date of Birth', _dobController, screenSize,
                      labelFontSize, textFieldHeight),
                  SizedBox(height: verticalPadding * 2),

                  // Account Deletion & Export section
                  Center(
                    child: Text(
                      'Account Deletion & Export',
                      style: TextStyle(
                        color: const Color(0xFF6ECDF8),
                        fontSize: labelFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: verticalPadding),

                  // Activity History
                  _buildAccountOption(
                    'Activity History',
                    'Monitoring logins, transactions, and past account-related actions.',
                    Icons.arrow_forward_ios,
                    screenSize,
                    labelFontSize,
                    subtitleFontSize,
                    () {},
                  ),
                  SizedBox(height: verticalPadding),

                  // Delete Account
                  _buildAccountOption(
                    'Delete your Account',
                    'Disable or delete your account.',
                    Icons.arrow_forward_ios,
                    screenSize,
                    labelFontSize,
                    subtitleFontSize,
                    () {},
                  ),
                  SizedBox(height: verticalPadding * 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController controller,
    Size screenSize,
    double labelFontSize,
    double height,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: labelFontSize,
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAccountOption(
    String title,
    String subtitle,
    IconData icon,
    Size screenSize,
    double titleFontSize,
    double subtitleFontSize,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: titleFontSize * 0.9,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: subtitleFontSize,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              icon,
              color: Colors.white,
              size: screenSize.width * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
