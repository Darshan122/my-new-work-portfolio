import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/models/design_process.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';


final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "FLUTTER DEVELOPMENT",
    imagePath: "assets/ic_flutter.png",
    subtitle: "Building cross-platform apps with Flutter framework using Dart, with expertise in state management",
  ),
  DesignProcess(
    title: "ANDROID DEVELOPMENT",
    imagePath: "assets/ic_android.png",
    subtitle: "Native Android development using Kotlin/Java, Jetpack Components, and Material Design",
  ),
  DesignProcess(
    title: "UI/UX DESIGN",
    imagePath: "assets/ic_figma.png",
    subtitle: "Designing intuitive user interfaces with attention to UX principles and modern design trends",
  ),
  DesignProcess(
    title: "iOS DEVELOPMENT",
    imagePath: "assets/ic_xcode.png",
    subtitle: "Native iOS development using Swift and SwiftUI in Xcode, with App Store deployment",
  ),
];

Future<void> downloadCV(BuildContext context) async {
  try {
    // Verify asset exists first
    await rootBundle.load('cv/Darshan_Zalavadiya_Resume.pdf');

    // For web
    if (kIsWeb) {
      final bytes = (await rootBundle.load('cv/Darshan_Zalavadiya_Resume.pdf'))
          .buffer
          .asUint8List();
      final blob = html.Blob([bytes], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..download = 'Darshan_Zalavadiya_Resume.pdf'
        ..style.display = 'none';

      html.document.body?.children.add(anchor);
      anchor.click();
      html.document.body?.children.remove(anchor);
      html.Url.revokeObjectUrl(url);
    }
    // For mobile/desktop
    else {
      final bytes = (await rootBundle.load('cv/Darshan_Zalavadiya_Resume.pdf'))
          .buffer
          .asUint8List();
      final directory = await getDownloadsDirectory();
      final file = File('${directory?.path}/Darshan_Zalavadiya_Resume.pdf');
      await file.writeAsBytes(bytes);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('CV downloaded to ${file.path}')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to download CV: $e')),
    );
    debugPrint('CV download error: $e');

    // Fallback to online version if available
    const fallbackUrl = 'https://yourwebsite.com/cv.pdf';
    if (await canLaunch(fallbackUrl)) {
      await launch(fallbackUrl);
    }
  }
}

class CvSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    // we need the context to get maxWidth before the constraints below
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // "BETTER DESIGN,\nBETTER EXPERIENCES",
                "MOBILE DEVELOPMENT EXPERTISE\n(Flutter • Android • iOS)",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  height: 1.8,
                  fontSize: 18.0,
                ),
              ),
              GestureDetector(
                onTap: () => downloadCV(context),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    "DOWNLOAD CV",
                    style: GoogleFonts.oswald(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            child: LayoutBuilder(
              builder: (_context, constraints) {
                return ResponsiveGridView.builder(
                  padding: EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  alignment: Alignment.topCenter,
                  gridDelegate: ResponsiveGridDelegate(
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 0.0,
                    maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                            ScreenHelper.isMobile(context)
                        ? constraints.maxWidth / 2.0
                        : 260.0,
                    // Hack to adjust child height
                    childAspectRatio: ScreenHelper.isDesktop(context)
                        ? 1
                        : MediaQuery.of(context).size.aspectRatio * 1.5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                designProcesses[index].imagePath,
                                width: 40.0,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                child: Text(
                                  designProcesses[index].title,
                                  style: GoogleFonts.oswald(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            designProcesses[index].subtitle,
                            style: TextStyle(
                              color: kCaptionColor,
                              height: 1.5,
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: designProcesses.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
