import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/globals.dart';

import '../../../utils/screen_helper.dart';

class Header extends StatelessWidget {
  final VoidCallback? onHireMePressed;

  const Header({Key? key, this.onHireMePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildHeader(context, kDesktopMaxWidth),
        tablet: _buildHeader(context, kTabletMaxWidth),
        mobile: _buildHeaderMobile(context),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, double width) {
    return Center(
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Scrollable.ensureVisible(
                      Globals.scaffoldKey.currentContext!,
                      duration: Duration(seconds: 1),
                    );
                  },
                  child: Text(
                    "Darshan Zalavadiya",
                    style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Navigation Items
              Row(
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Scrollable.ensureVisible(
                          introKey.currentContext!,
                          duration: Duration(seconds: 1),
                        );
                      },
                      child: Text(
                        "About",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.0),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Scrollable.ensureVisible(
                          servicesKey.currentContext!,
                          duration: Duration(seconds: 1),
                        );
                      },
                      child: Text(
                        "Services",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.0),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Scrollable.ensureVisible(
                          portfolioKey.currentContext!,
                          duration: Duration(seconds: 1),
                        );
                      },
                      child: Text(
                        "Portfolio",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.0),
                  // Hire Me Button
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 5.0,
                      ),
                      child: TextButton(
                        onPressed: onHireMePressed,
                        child: Text(
                          "HIRE ME",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderMobile(BuildContext context) {
    return Center(
      child: ResponsiveWrapper(
        maxWidth: getMobileMaxWidth(context),
        minWidth: getMobileMaxWidth(context),
        defaultScale: false,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              Text(
                "Darshan Zalavadiya",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Menu Button
              GestureDetector(
                onTap: () {
                  Globals.scaffoldKey.currentState!.openEndDrawer();
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 28.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderDrawer extends StatelessWidget {
  final VoidCallback? onHireMePressed;

  const HeaderDrawer({Key? key, this.onHireMePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF1D1D1D),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 24.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close Button
              Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 28.0,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              // Navigation Items
              _buildDrawerItem("About", () {
                Navigator.pop(context);
                Scrollable.ensureVisible(
                  introKey.currentContext!,
                  duration: Duration(seconds: 1),
                );
              }),
              _buildDrawerItem("Services", () {
                Navigator.pop(context);
                Scrollable.ensureVisible(
                  servicesKey.currentContext!,
                  duration: Duration(seconds: 1),
                );
              }),
              _buildDrawerItem("Portfolio", () {
                Navigator.pop(context);
                Scrollable.ensureVisible(
                  portfolioKey.currentContext!,
                  duration: Duration(seconds: 1),
                );
              }),
              SizedBox(height: 20.0),
              // Hire Me Button in Drawer
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onHireMePressed?.call();
                  },
                  child: Text(
                    "HIRE ME",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      onTap: onTap,
    );
  }
}