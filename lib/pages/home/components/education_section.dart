import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/education.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<Education> educationList = [
  Education(
    description:
    "Bachelor of Technology in Information Technology. Gained comprehensive knowledge in software development, databases, networking, and modern IT technologies. Completed various projects demonstrating practical application of programming concepts.",
    linkName: "R.K. University, Rajkot",
    period: "2020 - 2024",
  ),
  Education(
    description:
    "Completed Higher Secondary Education with focus on science and mathematics. Built strong foundation in analytical thinking and problem-solving skills.",
    linkName: "Shree Swaminarayan Gurukul, Mahuva",
    period: "2018 - 2020",
  ),
];

final List<Education> experienceList = [
  Education(
    description:
    "Working as Flutter Developer, developing cross-platform mobile applications. Contributing to various projects using Dart, Flutter framework, and implementing modern UI/UX designs.",
    linkName: "Morphic IT Solution",
    period: "Sep 2024 - Present",
  ),
  Education(
    description:
    "Worked as Junior Android Developer, involved in mobile app development using Java and Kotlin. Gained hands-on experience in Android SDK, REST APIs, and mobile application architecture.",
    linkName: "Batball 11",
    period: "Nov 2023 - Oct 2024",
  ),
  Education(
    description:
    "Completed internship as Android Developer. Learned mobile development fundamentals, worked on real-world projects, and collaborated with development teams.",
    linkName: "Batball 11",
    period: "May 2023 - Nov 2023",
  ),
];

class EducationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Container(
      alignment: Alignment.center,
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Education Section
            Text(
              "EDUCATION",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                height: 1.3,
              ),
            ),
            SizedBox(height: 5.0),
            Wrap(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 400.0),
                  child: Text(
                    "My academic journey in technology and engineering that laid the foundation for my career in software development.",
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.0),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: educationList
                        .map(
                          (education) => Container(
                        width: constraints.maxWidth / 2.0 - 20.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              education.period,
                              style: GoogleFonts.oswald(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              education.description,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: kCaptionColor,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  education.linkName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 40.0),
                          ],
                        ),
                      ),
                    )
                        .toList(),
                  ),
                );
              },
            ),

            // Experience Section
            SizedBox(height: 60.0),
            Text(
              "EXPERIENCE",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                height: 1.3,
              ),
            ),
            SizedBox(height: 5.0),
            Wrap(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 400.0),
                  child: Text(
                    "My professional journey in mobile app development, from internship to current role as Flutter Developer.",
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.0),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: experienceList
                        .map(
                          (experience) => Container(
                        width: constraints.maxWidth / 2.0 - 20.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              experience.period,
                              style: GoogleFonts.oswald(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              experience.description,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: kCaptionColor,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  experience.linkName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 40.0),
                          ],
                        ),
                      ),
                    )
                        .toList(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}