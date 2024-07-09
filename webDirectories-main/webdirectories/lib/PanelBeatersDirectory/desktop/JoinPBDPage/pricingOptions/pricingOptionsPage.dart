import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/pricingOptions/ui/paymentPlanComtainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/customPlan.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/glassContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/toggleSwitch.dart';

class PricingOptionsPage extends StatefulWidget {
  Function(int) updateContainerIndex;
  Function(String) updatePackageType;
  PricingOptionsPage(
      {super.key,
      required this.updateContainerIndex,
      required this.updatePackageType});

  @override
  State<PricingOptionsPage> createState() => _PricingOptionsPageState();
}

class _PricingOptionsPageState extends State<PricingOptionsPage> {
  //Open popup register
  Future openRegistrationProcess() => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: CustomPlans(closeDialog: () => Navigator.pop(context)));
      });
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: GlassEffect(
        child: Container(
          height: heightDevice * 0.76,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pricing Options:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Perfectly tailored for every stage of your growth. Get started today!',
                style: TextStyle(
                    color: Color(0xFFF4F4F4),
                    fontSize: 18,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w500,
                    height: 1),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Monthly',
                      style: TextStyle(
                        color: Color(0xFFF4F4F4),
                        fontSize: 20,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    width: 15,
                  ),
                  ToggleSwitch(),
                  SizedBox(
                    width: 15,
                  ),
                  Text('Annually',
                      style: TextStyle(
                        color: Color(0xFFF4F4F4),
                        fontSize: 20,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
              SizedBox(
                height: heightDevice / 80,
              ),
              SizedBox(
                height: heightDevice * 0.50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PaymentPlanContainer(
                      readMore: () {
                        widget.updateContainerIndex(4);
                        widget.updatePackageType("Starter");
                      },
                      register: () {
                        openRegistrationProcess();
                      },
                      price: 'R0.0',
                      checkedItems: const [
                        'Free Profile',
                        'No Activation Fee',
                        'Industry Specific',
                        'Address',
                        'Email Contact with Customers',
                        'Riviews',
                      ],
                      priceTitle: 'Starter',
                      priceType: 'Monthly',
                      billingText: 'billed monthly, excluding VAT',
                    ),
                    SizedBox(
                      width: widthDevice / 50,
                    ),
                    PaymentPlanContainer(
                      readMore: () {
                        widget.updateContainerIndex(4);
                        widget.updatePackageType("Core");
                      },
                      register: () {
                        openRegistrationProcess();
                      },
                      price: 'R99',
                      checkedItems: const [
                        'Include All Starter Benefits',
                        'Activation Fee (R299 once off)',
                        'Owners Portal Access',
                        'Contact Detail',
                        'Navigation ',
                        'Job Finder',
                        'SEO Optimization'
                      ],
                      priceTitle: 'Core',
                      priceType: 'Monthly',
                      billingText: 'billed monthly, excluding VAT',
                    ),
                    SizedBox(
                      width: widthDevice / 50,
                    ),
                    PaymentPlanContainer(
                      readMore: () {
                        widget.updateContainerIndex(4);
                        widget.updatePackageType("Premium");
                      },
                      register: () {
                        openRegistrationProcess();
                      },
                      price: 'R434',
                      checkedItems: const [
                        'Include All Core Benefits',
                        'Activation Fee (R299 once off)',
                        'Online Profile',
                        'Quotation Requests',
                        'Accreditations',
                        'Client Interaction',
                        'Publish Special Offers',
                        'Parts & Equipment Trading'
                      ],
                      priceTitle: 'Premium',
                      priceType: 'Monthly',
                      billingText: 'billed monthly, excluding VAT',
                    ),
                    SizedBox(
                      width: widthDevice / 50,
                    ),
                    PaymentPlanContainer(
                      readMore: () {
                        widget.updateContainerIndex(4);
                        widget.updatePackageType("PremiumPlus");
                      },
                      register: () {
                        openRegistrationProcess();
                      },
                      price: 'R520',
                      checkedItems: const [
                        'Include All Premium Benefits',
                        'Activation Fee (R299 once off)',
                        'Domain Hosting',
                        'Email Hosting',
                      ],
                      priceTitle: 'Premium +',
                      priceType: 'Monthly',
                      billingText: 'billed monthly, excluding VAT',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
