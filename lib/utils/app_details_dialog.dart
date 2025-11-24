import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/home/components/ios_app_ad.dart';

class AppDetailsDialog extends StatefulWidget {
  final AppItem app;

  const AppDetailsDialog({Key? key, required this.app}) : super(key: key);

  @override
  _AppDetailsDialogState createState() => _AppDetailsDialogState();
}

class _AppDetailsDialogState extends State<AppDetailsDialog> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 700;
    _pageController = PageController(viewportFraction: isMobile ? 0.9 : 0.8);

    // Add listener to update current page (optional - if you want real-time updates)
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bool isMobile = screenWidth < 700;

    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          /// 🌫️ Blurred Background
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(color: Colors.black.withOpacity(0.4)),
            ),
          ),

          /// 💫 Popup Content
          Center(
            child: Container(
              width: screenWidth * 0.95,
              height: screenHeight * 0.9,
              padding: EdgeInsets.all(isMobile ? 16 : 30),
              decoration: BoxDecoration(
                color: Colors.grey[900]!.withOpacity(0.95),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: widget.app.primaryColor.withOpacity(0.3)),
                boxShadow: [
                  BoxShadow(
                    color: widget.app.primaryColor.withOpacity(0.5),
                    blurRadius: 25,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Column(
                children: [
                  /// 🏷️ Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.app.title,
                          style: GoogleFonts.oswald(
                            fontSize: isMobile ? 20 : 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.white70),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  /// 📄 Description
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.app.description,
                            style: TextStyle(
                              color: Colors.white70,
                              height: 1.5,
                              fontSize: isMobile ? 14 : 16,
                            ),
                          ),
                          SizedBox(height: 25),

                          /// 🖼️ Screenshot Slider
                          if (widget.app.screenshots.isNotEmpty) ...[
                            Column(
                              children: [
                                SizedBox(
                                  height: isMobile
                                      ? screenHeight * 0.6
                                      : screenHeight * 0.65,
                                  child: PageView.builder(
                                    controller: _pageController,
                                    itemCount: widget.app.screenshots.length,
                                    onPageChanged: (index) {
                                      setState(() {
                                        _currentPage = index;
                                      });
                                    },
                                    itemBuilder: (context, index) {
                                      final isActive = index == _currentPage;
                                      return AnimatedContainer(
                                        duration: Duration(milliseconds: 400),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: isActive ? 0 : 20,
                                        ),
                                        child: Transform.scale(
                                          scale: isActive ? 1.0 : 0.9,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Image.asset(
                                              widget.app.screenshots[index],
                                              fit: BoxFit.contain,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Container(
                                                  color: Colors.grey[800],
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.error,
                                                      color: Colors.white,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 16),

                                /// 🔵 Page Indicators
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    widget.app.screenshots.length,
                                        (index) => GestureDetector(
                                      onTap: () {
                                        _pageController.animateToPage(
                                          index,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                        );
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        margin: EdgeInsets.symmetric(horizontal: 4),
                                        width: _currentPage == index ? 16 : 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: _currentPage == index
                                              ? widget.app.primaryColor
                                              : Colors.white30,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],

                          SizedBox(height: 30),

                          /// 🎬 Live Demo Button
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: widget.app.primaryColor,
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 24 : 40,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                elevation: 10,
                                shadowColor: widget.app.primaryColor.withOpacity(0.5),
                              ),
                              icon: Icon(Icons.play_circle_fill,
                                  color: Colors.white, size: 22),
                              label: Text(
                                "LIVE DEMO",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: isMobile ? 13 : 15,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                // Add url_launcher logic here if you have app.liveDemoUrl
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}