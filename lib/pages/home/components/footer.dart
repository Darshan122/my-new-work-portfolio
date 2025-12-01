import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/footer_item.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';
import 'package:url_launcher/url_launcher.dart';

final List<FooterItem> footerItems = [
  FooterItem(
    iconPath: "assets/mappin.png",
    title: "ADDRESS",
    text1: "Ahmedabad",
    // text2: "Sailor Springs, IL 64234",
    onTap: (context) {
      // Open Google Maps with the address
      final encodedAddress = Uri.encodeFull("Ahmedabad, Gujarat, India");
      launchUrl(Uri.parse('https://www.google.com/maps/search/?api=1&query=$encodedAddress'));
    },
  ),
  FooterItem(
    iconPath: "assets/phone.png",
    title: "PHONE",
    text1: "+91 728-408-8737",
    // text2: "+1 781-689-9632",
    onTap: (context) {
      // Make a phone call
      launchUrl(Uri.parse('tel:+917284088737'));
    },
  ),
  FooterItem(
    iconPath: "assets/email.png",
    title: "EMAIL",
    text1: "dzalavadiya122@gmail.com",
    // text2: "info@flutterpanda.com",
    onTap: (context) {
      // Send an email
      launchUrl(Uri.parse('mailto:dzalavadiya122@gmail.com?subject=Contact%20from%20Portfolio&body=Hello%20Darshan,'));
    },
  ),
  FooterItem(
    iconPath: "assets/whatsapp.png",
    title: "WHATSAPP",
    text1: "+91 728-408-8737",
    // text2: "+234 901-134-0095",
    onTap: (context) {
      // Open WhatsApp
      launchUrl(Uri.parse('https://wa.me/917284088737?text=Hello%20Darshan,%20I%20came%20across%20your%20portfolio...'));
    },
  )
];


class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => footerItem.onTap?.call(context),
                        child: Container(
                          height: 120.0,
                          width: ScreenHelper.isMobile(context)
                              ? constraints.maxWidth / 2.0 - 20.0
                              : constraints.maxWidth / 4.0 - 20.0,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.transparent,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.transparent,
                                  blurRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      footerItem.iconPath,
                                      width: 25.0,
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      footerItem.title,
                                      style: GoogleFonts.oswald(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: footerItem.text1,
                                        style: TextStyle(
                                          color: kCaptionColor,
                                          height: 1.8,
                                        ),
                                      ),
                                      if (footerItem.text2 != null && footerItem.text2!.isNotEmpty)
                                        TextSpan(
                                          text: "\n${footerItem.text2}",
                                          style: TextStyle(
                                            color: kCaptionColor,
                                          ),
                                        )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                mainAxisAlignment: ScreenHelper.isMobile(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        // Open copyright info or scroll to top
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('© 2025 Darshan Zalavadiya'),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Copyright (c) 2025 Darshan Zalavadiya. All rights Reserved",
                          style: TextStyle(
                            color: kCaptionColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () async {
                            // Open privacy policy URL or show dialog
                            const privacyUrl = 'https://yourwebsite.com/privacy-policy';
                            if (await canLaunchUrl(Uri.parse(privacyUrl))) {
                              await launchUrl(Uri.parse(privacyUrl));
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Privacy Policy'),
                                  content: Text('Your privacy policy content here...'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Close'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: kCaptionColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "|",
                          style: TextStyle(
                            color: kCaptionColor,
                          ),
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () async {
                            // Open terms & conditions URL or show dialog
                            const termsUrl = 'https://yourwebsite.com/terms-conditions';
                            if (await canLaunchUrl(Uri.parse(termsUrl))) {
                              await launchUrl(Uri.parse(termsUrl));
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Terms & Conditions'),
                                  content: Text('Your terms and conditions content here...'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Close'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyle(
                              color: kCaptionColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      )
                    ],
                  )*/
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}