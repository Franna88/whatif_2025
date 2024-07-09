import 'package:flutter/cupertino.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/packageInfoPages/packagesPage.dart';

class PremiumPlusPackagePage extends StatelessWidget {
  const PremiumPlusPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PackagesPage(
        infoText:
            'Build upon your included Starter, Core & Premium \nBenefits with our most comprehensive solution. This \nmeans you\'ll get a professional domain name*, email \nhosting, user management, and even a discount on \ncapturing your business professionally.',
        titleText: 'Premium +',
        infoText2: '',
        price: 'R520',
        exploreOptions: [],
        benefitsTextItems: [
          {
            'boldText': 'All starter, core & premium benefits included',
            'text': '.'
          },
          {
            'boldText': 'Own your Online Identity:',
            'text':
                'Establish a professional brand presence with a .co.za \ndomain name and annual hosting.  Your custom domain (e.g., yourshop.co.za) will be \nseamlessly linked to your directory profile, creating a trusted online destination for your \nbusiness, without the need to develop and maintain a separate website.'
          },
          {
            'boldText': 'Email:',
            'text':
                'The client can create and manage up to 20 email accounts, linked to this .co.za \nhosted domain service.'
          },
          {
            'boldText': 'Add unlimited users and groups',
            'text': 'in your Owners Portal.'
          },
          {
            'boldText': 'Corporate discount',
            'text':
                ' on professional photo and video shoot that capture your \nworkshop, team and quality of work.'
          }
        ],
        optionText: 'Premium+ Package',
        ballPointItems: [
          'Businesses seeking complete online dominance.',
          'Businesses seeking a complete online solution, including a custom domain and \nprofessional email accounts.'
        ]);
  }
}
