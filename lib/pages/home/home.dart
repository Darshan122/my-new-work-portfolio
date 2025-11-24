import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:web_portfolio/pages/home/components/carousel.dart';
import 'package:web_portfolio/pages/home/components/cv_section.dart';
import 'package:web_portfolio/pages/home/components/education_section.dart';
import 'package:web_portfolio/pages/home/components/footer.dart';
import 'package:web_portfolio/pages/home/components/header.dart';
import 'package:web_portfolio/pages/home/components/ios_app_ad.dart';
import 'package:web_portfolio/pages/home/components/skill_section.dart';
import 'package:web_portfolio/pages/home/components/hire_me_dialog.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/globals.dart';

class Home extends StatelessWidget {
  void _showHireMeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return HireMeDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: HeaderDrawer(
        onHireMePressed: () => _showHireMeDialog(context),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Home Section
              Container(
                key: homeKey,
                child: Header(
                  onHireMePressed: () => _showHireMeDialog(context),
                ),
              ),
              Carousel(),

              // My Intro Section
              Container(
                key: introKey,
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    CvSection(),
                  ],
                ),
              ),

              // Services Section
              Container(
                key: servicesKey,
                child: Column(
                  children: [
                    IosAppAd(),
                    SizedBox(height: 70.0),
                  ],
                ),
              ),

              // Portfolio Section
              Container(
                key: portfolioKey,
                child: Column(
                  children: [
                    EducationSection(),
                    SizedBox(height: 50.0),
                    SkillSection(),
                  ],
                ),
              ),

              // Footer Section
              Container(
                key: hireMeKey,
                child: Column(
                  children: [
                    SizedBox(height: 50.0),
                    Footer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}