import 'package:flutter/material.dart';

import '../packagesPage.dart';

class PremiumPackagePage extends StatelessWidget {
  const PremiumPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PackagesPage(
      infoText:
          'This package elevates your online presence beyond \nyour included Starter & Core Benefits. Dominate \nonline searches, simplify lead management, and \nbuild unwavering customer trust! Build and \ncustomise your full profile and showcase your \nexpertise, accreditations, team members and unique \nstory.',
      titleText: 'Premium',
      infoText2:
          'Evaluate key metrics and track your online \nperformance. Integrate your Lightstone EchoMBR \nresults to demonstrate your commitment to quality \nrepairs and better streamline your communication \nwith your clients.  Utilize our parts & equipment \nplatform to buy & sell. Publish special offers & \npromotions.',
      price: 'R434',
      exploreOptions: [
        {
          'mainTitle': 'Own you digital\nidentity',
          'description':
              'Build a trusted destination for your business\n with a custom domain, email, and professional\n branding.',
          'assetName': 'images/exploreOptions3.png',
          'buttonText': 'Premium+ Option'
        }
      ],
      benefitsTextItems: [
        {'boldText': 'All starter & core benefits included', 'text': '.'},
        {
          'boldText': 'Unmatched Online Presence:',
          'text':
              ' We cross-link your profile across relevant \ndirectories, ensuring maximum online reach and our advanced SEO and SEM strategies \nto make you the top choice. Display a premium photo and video gallery with links to \nyour website and all social media platforms.'
        },
        {
          'boldText': 'Streamlined Client Management:',
          'text':
              ' Enjoy the convenience of our secure Owners \nPortal. Nominate and manage up to 4 additional users, edit your profile 24/7, and \nupdate staff changes, registration documents, OEM accreditations, insurance panel \ncontracts, franchise affiliations and industry bodies and specialist services!'
        },
        {
          'boldText': 'Actionable Insights & Transparency:',
          'text':
              ' Gain a competitive edge with up to date \nLightstone CSI reports in your Owners Portal and publicly displayed on your profile. \nBuild trust by showcasing your commitment to quality repairs.'
        },
        {
          'boldText': 'Effortless Customer Communication:',
          'text':
              ' Enable a service rating tool for client \nfeedback. Showcase your team with staff photos, designations and more.'
        },
        {
          'boldText': 'Advertise special offers',
          'text': ' directly through your profile to incentivize customers.'
        },
        {
          'boldText': 'List financial assistance option',
          'text': ' available to clients through 3rd party platforms.'
        },
        {
          'boldText': 'Utilize our Parts & Equipment Platform',
          'text': ' to sell or trade with other auto body \nspecialists.'
        }
      ],
      ballPointItems: [
        'Established panel beating businesses and franchise shops seeking to dominate \nthe online market',
        'Businesses with OEM Approvals and Insurance Panel Accreditations looking to \nattract high-value clients and maximize lead generation',
        'Businesses who prioritize communication, transparency, and a customer-centric \nexperience.'
      ],
      optionText: 'Premium Option',
    );
  }
}
