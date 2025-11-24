import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/models/carousel_item_model.dart';
import 'package:web_portfolio/utils/constants.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    text: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Flutter & Android Developer",
            style: GoogleFonts.oswald(
              color: kPrimaryColor,
              fontWeight: FontWeight.w900,
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(
            "Darshan\nZalavadiya",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              height: 1.3,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Building beautiful, high-performance cross-platform apps",
            style: TextStyle(
              color: kCaptionColor,
              fontSize: 15.0,
              height: 1.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Wrap(
              children: [
                Text(
                  "Need a mobile app for Android & iOS?",
                  style: TextStyle(
                    color: kCaptionColor,
                    fontSize: 15.0,
                    height: 1.5,
                  ),
                ),
                /*GestureDetector(
                  onTap: () {},
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      " Let's build something amazing!",
                      style: TextStyle(
                        height: 1.5,
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                )*/
                Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          showGeneralDialog(
                            context: context,
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return ScaleTransition(
                                scale: CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.fastOutSlowIn,
                                ),
                                child: FadeTransition(
                                  opacity: animation,
                                  child: Dialog(
                                    insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                                    backgroundColor: Colors.transparent,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.9,
                                      constraints: BoxConstraints(maxWidth: 500),
                                      decoration: BoxDecoration(
                                        color: kBackgroundColor,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.2),
                                            blurRadius: 20,
                                            spreadRadius: 5,
                                          )
                                        ],
                                      ),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                      // Header Section with subtle animation
                                      SlideTransition(
                                      position: Tween<Offset>(
                                          begin: Offset(0, -0.1),
                                      end: Offset.zero,
                                    ).animate(CurvedAnimation(
                                      parent: animation,
                                      curve: Interval(0.0, 0.5, curve: Curves.easeOut),
                                    ),),
                                      child: FadeTransition(
                                        opacity: Tween<double>(begin: 0, end: 1).animate(
                                          CurvedAnimation(
                                            parent: animation,
                                            curve: Interval(0.0, 0.5, curve: Curves.easeIn),
                                          ),),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
                                            child: Text(
                                              "Let's Connect!",
                                              style: TextStyle(
                                                color: Theme.of(context).primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Contact Options with staggered animation
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        child: Column(
                                          children: [
                                          // Email - Animated
                                          AnimatedContactOptionTile(
                                          animation: animation,
                                          interval: Interval(0.2, 0.6),
                                          icon: Icons.email,
                                          title: "Email Me",
                                          subtitle: "dzalavadiya122@gmail.com",
                                          onTap: () {
                                            Navigator.pop(context);
                                            final Uri emailUri = Uri(
                                              scheme: 'mailto',
                                              path: 'dzalavadiya122@gmail.com',
                                              queryParameters: {'subject': 'Flutter/Android Project Inquiry'},
                                            );
                                            launchUrl(emailUri);
                                          },
                                        ),

                                        Divider(
                                          color: kCaptionColor.withOpacity(0.3),
                                          height: 1,
                                          thickness: 1,
                                        ),

                                        // Phone - Animated
                                        AnimatedContactOptionTile(
                                          animation: animation,
                                          interval: Interval(0.3, 0.7),
                                          icon: Icons.phone,
                                          title: "Call Me",
                                          subtitle: "+91 7284088737",
                                          onTap: () {
                                            Navigator.pop(context);
                                            launchUrl(Uri.parse('tel:+91 7284088737'));
                                          },
                                        ),

                                        SizedBox(height: 16),

                                        // Social Media - Animated
                                        SlideTransition(
                                          position: Tween<Offset>(
                                            begin: Offset(0, 0.2),
                                            end: Offset.zero,
                                          ).animate(CurvedAnimation(
                                            parent: animation,
                                            curve: Interval(0.5, 0.8, curve: Curves.easeOut),
                                          )),
                                          child: FadeTransition(
                                            opacity: Tween<double>(begin: 0, end: 1).animate(
                                              CurvedAnimation(
                                                parent: animation,
                                                curve: Interval(0.5, 0.8, curve: Curves.easeIn),
                                              ),),
                                              child: Column(
                                                children: [
                                                Text(
                                                "Find me on social media",
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SocialMediaButton(
                                                    iconPath: 'assets/github_icon.svg',
                                                    onPressed: () => launchUrl(Uri.parse('https://github.com/yourprofile')),),
                                                    SizedBox(width: 24),
                                                    SocialMediaButton(
                                                      iconPath: 'assets/linkedin_icon.svg',
                                                      onPressed: () => launchUrl(Uri.parse('https://linkedin.com/in/yourprofile')),
                                                    ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          ],
                                        ),
                                      ),

                                      // Close Button with fade animation
                                      FadeTransition(
                                        opacity: Tween<double>(begin: 0, end: 1).animate(
                                          CurvedAnimation(
                                            parent: animation,
                                            curve: Interval(0.7, 1.0, curve: Curves.easeIn),
                                          ),),
                                          child: Padding(
                                            padding: EdgeInsets.all(12),
                                            child: TextButton(
                                              child: Text(
                                                "Close",
                                                style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              onPressed: () => Navigator.pop(context),
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
                            transitionDuration: Duration(milliseconds: 400),
                            transitionBuilder: (context, animation, secondaryAnimation, child) {
                              return child;
                            },
                          );
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            child: Text(
                              " Let's build something amazing!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                )


              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 48.0,
              padding: EdgeInsets.symmetric(
                horizontal: 28.0,
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "GET STARTED",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
    image: Container(
      child: Image.asset(
        "assets/image_me.png",
        // "assets/person.png",
        fit: BoxFit.contain,
      ),
    ),
  ),
);
// Animated Contact Option Tile Widget
class AnimatedContactOptionTile extends StatelessWidget {
  final Animation<double> animation;
  final Interval interval;
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const AnimatedContactOptionTile({
    required this.animation,
    required this.interval,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0, 0.2),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: interval,
        ),
      ),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: animation,
            curve: interval,
          ),
        ),
        child: ContactOptionTile(
          icon: icon,
          title: title,
          subtitle: subtitle,
          onTap: onTap,
        ),
      ),
    );
  }
}

// Reusable Contact Option Tile Widget
class ContactOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ContactOptionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      leading: Icon(icon, color: kPrimaryColor, size: 28),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: kCaptionColor,
          fontSize: 14,
        ),
      ),
      onTap: onTap,
    );
  }
}

// Reusable Social Media Button Widget
class SocialMediaButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;

  const SocialMediaButton({
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 32,
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      icon: SvgPicture.asset(
        iconPath,
        color: Colors.white,
        width: 32,
        height: 32,
      ),
      onPressed: onPressed,
    );
  }
}
