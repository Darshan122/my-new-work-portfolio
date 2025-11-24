import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

class Skill {
  final String name;
  final Color color;
  final IconData icon;
  final String description;
  final List<String> features;

  Skill({
    required this.name,
    required this.color,
    required this.icon,
    required this.description,
    required this.features,
  });
}

List<Skill> skills = [
  Skill(
    name: "Dart",
    color: Colors.blue,
    icon: Icons.code,
    description: "Dart is a client-optimized programming language for apps on multiple platforms. It is developed by Google and is used to build mobile, desktop, backend, and web applications.",
    features: [
      "Strongly typed object-oriented language",
      "Ahead-of-time (AOT) compilation",
      "Just-in-time (JIT) compilation",
      "Garbage collection",
      "C-style syntax",
      "Used for Flutter development"
    ],
  ),
  Skill(
    name: "Flutter",
    color: Colors.lightBlue,
    icon: Icons.mobile_friendly,
    description: "Flutter is Google's UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.",
    features: [
      "Cross-platform development",
      "Hot reload for fast development",
      "Rich set of pre-designed widgets",
      "Native performance",
      "Single codebase for multiple platforms",
      "Strong community support"
    ],
  ),
  Skill(
    name: "Android Studio",
    color: Colors.green,
    icon: Icons.android,
    description: "Android Studio is the official integrated development environment for Google's Android operating system.",
    features: [
      "Intelligent code editor",
      "Flexible build system",
      "Fast and feature-rich emulator",
      "Visual layout editor",
      "APK analyzer",
      "Integrated with Android SDK"
    ],
  ),
  Skill(
    name: "Java",
    color: Colors.orange,
    icon: Icons.coffee,
    description: "Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible.",
    features: [
      "Platform independent",
      "Object-oriented programming",
      "Multithreading support",
      "Automatic memory management",
      "Rich API library",
      "Strong community and enterprise support"
    ],
  ),
  Skill(
    name: "Kotlin",
    color: Colors.purple,
    icon: Icons.developer_mode,
    description: "Kotlin is a cross-platform, statically typed, general-purpose programming language with type inference.",
    features: [
      "Concise and safe code",
      "Interoperable with Java",
      "Null safety features",
      "Extension functions",
      "Coroutines for async programming",
      "Official language for Android development"
    ],
  ),
  Skill(
    name: "Xcode",
    color: Colors.blue,
    icon: Icons.phone_iphone,
    description: "Xcode is an integrated development environment for macOS containing a suite of software development tools developed by Apple.",
    features: [
      "Interface Builder",
      "iOS Simulator",
      "Instruments for performance analysis",
      "TestFlight integration",
      "Swift programming language support",
      "macOS and iOS development"
    ],
  ),
  Skill(
    name: "Firebase",
    color: Colors.amber,
    icon: Icons.cloud,
    description: "Firebase is a Backend-as-a-Service platform developed by Google for creating mobile and web applications.",
    features: [
      "Firebase Authentication",
      "Cloud Firestore & Realtime Database",
      "Firebase Storage for files",
      "Cloud Functions for backend logic",
      "Analytics and Crashlytics",
      "Push Notifications (FCM)"
    ],
  ),
  Skill(
    name: "State Management",
    color: Colors.purple,
    icon: Icons.settings,
    description: "Managing application state efficiently in Flutter applications using various state management solutions.",
    features: [
      "Provider for simple state management",
      "Bloc/Cubit for complex state logic",
      "GetX for lightweight solution",
      "Riverpod for dependency injection",
      "State restoration",
      "Reactive programming patterns"
    ],
  ),
  Skill(
    name: "UI/UX Design",
    color: Colors.pink,
    icon: Icons.design_services,
    description: "Creating beautiful and user-friendly interfaces following Material Design and Cupertino guidelines.",
    features: [
      "Material Design 3 principles",
      "Custom animations and transitions",
      "Responsive layout design",
      "Accessibility support",
      "Dark/light theme implementation",
      "Custom painter and canvas"
    ],
  ),
  Skill(
    name: "Git & GitHub",
    color: Colors.orange,
    icon: Icons.gite,
    description: "Version control system for collaborative development and code management in mobile app projects.",
    features: [
      "Branching and merging strategies",
      "Pull requests and code reviews",
      "GitHub Actions for CI/CD",
      "Conflict resolution",
      "Team collaboration",
      "Code versioning best practices"
    ],
  ),
  Skill(
    name: "Testing",
    color: Colors.red,
    icon: Icons.bug_report,
    description: "Writing tests to ensure app reliability, including unit tests, widget tests, and integration tests.",
    features: [
      "Unit testing with test package",
      "Widget testing for UI components",
      "Integration testing",
      "Mocking dependencies",
      "Test coverage analysis",
      "Continuous testing pipeline"
    ],
  ),
  Skill(
    name: "App Publishing",
    color: Colors.green,
    icon: Icons.shop,
    description: "Process of preparing and publishing mobile applications to Google Play Store and Apple App Store.",
    features: [
      "Google Play Console",
      "Apple Developer Program",
      "App signing and bundles",
      "Store listing optimization",
      "Release management",
      "Store compliance guidelines"
    ],
  ),
];

class SkillSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: ScreenHelper.isDesktop(context)
          ? EdgeInsets.symmetric(horizontal: 100.0, vertical: 80.0)
          : ScreenHelper.isTablet(context)
          ? EdgeInsets.symmetric(horizontal: 50.0, vertical: 60.0)
          : EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth,context),
        tablet: _buildUi(kTabletMaxWidth,context),
        mobile: _buildUi(getMobileMaxWidth(context),context),
      ),
    );
  }

  Widget _buildUi(double width,BuildContext context) {
    return Center(
      child: Container(
        width: width,
        child: Flex(
          direction: ScreenHelper.isMobile(context)
              ? Axis.vertical
              : Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image Section - Fixed with constrained height
            if (!ScreenHelper.isMobile(context))
              Expanded(
                flex: 4,
                child: Container(
                  height: 500, // Fixed height instead of percentage
                  padding: EdgeInsets.only(right: 40.0),
                  child: Image.asset(
                    "assets/image_me.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            if (!ScreenHelper.isMobile(context))
              SizedBox(width: 40.0),

            // Skills Content Section
            Expanded(
              flex: ScreenHelper.isMobile(context) ? 0 : 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SKILLS",
                    style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 36.0,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "My technical skills in mobile app development and software engineering tools. From programming languages to development tools and IDEs that I use to build robust applications.",
                    style: TextStyle(
                      color: kCaptionColor,
                      height: 1.6,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 40.0),

                  // For mobile layout - show image above skills grid
                  if (ScreenHelper.isMobile(context))
                    Container(
                      width: double.infinity,
                      height: 250,
                      margin: EdgeInsets.only(bottom: 30.0),
                      child: Image.asset(
                        "assets/image_me.png",
                        fit: BoxFit.contain,
                      ),
                    ),

                  // Skills Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: ScreenHelper.isMobile(context) ? 2 : 3,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: skills.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _showSkillDetails(context, skills[index]),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            decoration: BoxDecoration(
                              color: skills[index].color.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: skills[index].color.withOpacity(0.5),
                                width: 2.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  skills[index].icon,
                                  size: 40.0,
                                  color: skills[index].color,
                                ),
                                SizedBox(height: 12.0),
                                Text(
                                  skills[index].name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showSkillDetails(BuildContext context, Skill skill) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(20),
          child: Container(
            width: ScreenHelper.isMobile(context) ? double.infinity : 500,
            decoration: BoxDecoration(
              color: Color(0xFF1D1D1D),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: skill.color.withOpacity(0.2),
                                border: Border.all(color: skill.color),
                              ),
                              child: Icon(
                                skill.icon,
                                color: skill.color,
                                size: 30,
                              ),
                            ),
                            SizedBox(width: 16),
                            Text(
                              skill.name,
                              style: GoogleFonts.oswald(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      skill.description,
                      style: TextStyle(
                        color: kCaptionColor,
                        height: 1.5,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Key Features",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Column(
                      children: skill.features.map((feature) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 16,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  feature,
                                  style: TextStyle(
                                    color: kCaptionColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(
                          backgroundColor: skill.color,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                        child: Text(
                          "Close",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}