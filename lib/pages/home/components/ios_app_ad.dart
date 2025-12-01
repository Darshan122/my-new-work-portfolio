import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

class IosAppAd extends StatefulWidget {
  @override
  _IosAppAdState createState() => _IosAppAdState();
}

class _IosAppAdState extends State<IosAppAd> {
  final List<AppItem> apps = [
    AppItem(
      title: "ESH HealthCare App",
      tagline: "Flutter App",
      description:
      "A comprehensive healthcare solution enabling users to order prescription medicines, book online doctor consultations, and access fast home delivery of medical products.",
      image: "assets/ESH_image/img_esh.png",
      screenshots: [
        "assets/ESH_image/esh_screen 1.png",
        "assets/ESH_image/esh_screen 2.png",
        "assets/ESH_image/esh_screen 3.png",
        "assets/ESH_image/esh_screen 4.png",
        "assets/ESH_image/esh_screen 5.png",
        "assets/ESH_image/esh_screen 6.png",
        "assets/ESH_image/esh_screen 8.png",
      ],
      primaryColor: Colors.blue[800]!,
      liveDemoUrl: "https://play.google.com/store/apps/details?id=com.eswasthya.app",
    ),
    AppItem(
      title: "Entaj",
      tagline: "Flutter App",
      description:
      "An agricultural marketplace connecting farmers directly with consumers for fresh produce and transparent pricing.",
      image: "assets/img_entaj.png",
      screenshots: [
        "assets/img_entaj.png",
        "assets/img_entaj.png",
      ],
      primaryColor: Colors.green[700]!,
      liveDemoUrl: "https://example.com/demo2",
    ),
    AppItem(
      title: "Ultra Rays",
      tagline: "Flutter App",
      description:
      "Welcome to Ultra Rays — where we believe that solar energy should be within everyone’s reach. We're on a mission to make solar simple, affordable, and transparent through the Ultra Rays App — India’s first all-in-one solar platform.Whether you’re a homeowner or a business, our app streamlines every step of your solar journey — from getting real-time quotes to booking services and claiming subsidies.",
      image: "assets/img_ultraRays.png",
      screenshots: [
        "assets/UltraRays_image/Splash-portrait.png",
        "assets/UltraRays_image/Home-portrait.png",
        "assets/UltraRays_image/Select Plan-portrait.png",
        "assets/UltraRays_image/Plan Quotation-portrait.png",
        "assets/UltraRays_image/Plan Quotation1-portrait.png",
        "assets/UltraRays_image/Payment-portrait.png",
        "assets/UltraRays_image/Payment1-portrait.png",
        "assets/UltraRays_image/My Account-portrait.png",
      ],
      primaryColor: Colors.yellow[700]!,
      liveDemoUrl: "https://play.google.com/store/apps/details?id=ultraray.solar.energy.solutions",
    ),
    AppItem(
      title: "Ultra Rays Business",
      tagline: "Flutter App",
      description:
      "Welcome to Ultra Rays — where we believe that solar energy should be within everyone’s reach. We're on a mission to make solar simple, affordable, and transparent through the Ultra Rays App — India’s first all-in-one solar platform.Whether you’re a homeowner or a business, our app streamlines every step of your solar journey — from getting real-time quotes to booking services and claiming subsidies.",
      image: "assets/img_ultraRays.png",
      screenshots: [
        "assets/UltraRays_image/Splash-portrait.png",
        "assets/UltraRays_Business/Frame-portrait.png",
        "assets/UltraRays_Business/Home-portrait.png",
        "assets/UltraRays_Business/New Stock-portrait.png",
        "assets/UltraRays_Business/Deliver Stocks-portrait.png",
        "assets/UltraRays_Business/My Account-portrait.png",
        "assets/UltraRays_Business/User.-portrait.png",
      ],
      primaryColor: Colors.yellow[700]!,
      liveDemoUrl: "https://play.google.com/store/apps/details?id=ultraray.solar.energy.solutions",
    ),
    AppItem(
      title: "Theia",
      tagline: "Flutter App",
      description:
      "Theia is an augmented reality app that helps blind people navigate museums independently. Using voice guidance and AR technology, it describes exhibits and provides directions, making cultural spaces accessible to everyone.",
      image: "assets/img_theai.png",
      screenshots: [
        "assets/img_theai.png",
        "assets/img_theai.png",
      ],
      primaryColor: Colors.black!,
      liveDemoUrl: "https://play.google.com/store/apps/details?id=ultraray.solar.energy.solutions",
    ),
    AppItem(
      title: "CineConnections",
      tagline: "Flutter App",
      description:
      "Welcome to CineConnections, the world’s first dating app built exclusively for film lovers. Whether you’re a hopeless romantic who cries at every rom-com, a cinephile who lives for indie masterpieces, or a popcorn enthusiast who never misses a blockbuster premiere — this is your place to connect, chat, and fall in love through the magic of cinema.",
      image: "assets/img_cineconnection.png",
      screenshots: [
        "assets/img_cineconnection.png",
        "assets/img_cineconnection.png",
      ],
      primaryColor: Colors.blue[700]!,
      liveDemoUrl: "https://play.google.com/store/apps/details?id=com.infradate.cineconnections.app",
    ),
    AppItem(
      title: "BatBall11",
      tagline: "Android App",
      description:
      "BatBall11 is a fantasy cricket app where users create dream teams, join contests, and win real cash prizes. Live scoring, player stats, and multiple game formats for cricket enthusiasts.",
      image: "assets/img_cineconnection.png",
      screenshots: [
        "assets/img_cineconnection.png",
        "assets/img_cineconnection.png",
      ],
      primaryColor: Colors.blue[400]!,
      liveDemoUrl: "https://cdn.batball11.com/bb11_web/APK/batball11.apk?_gl=1*1eskitn*_gcl_au*MTQ5MzQ1MTA2My4xNzYyODYwNzE3*_ga*MTYyODIyNDI0Mi4xNzUyNDgzNzc0*_ga_EJ62MFWKJ8*czE3NjI4NjA3MTckbzMkZzAkdDE3NjI4NjA3MTkkajU4JGwwJGgxMzQyNDUzNzcx",
    ),
    AppItem(
      title: "Felicidade",
      tagline: "Flutter App",
      description:
      "Felicidade is your go-to app for finding community, support, and personal growth. It's a safe space to connect with like-minded people, get expert advice, and embark on self-discovery journeys",
      image: "assets/img_f.png",
      screenshots: [
        "assets/img_f.png",
        "assets/img_f.png",
      ],
      primaryColor: Colors.blue[400]!,
      liveDemoUrl: "https://play.google.com/store/apps/details?id=com.felicidade.social&hl=en_IN",
    ),
  ];

  void _showAppDetailsDialog(BuildContext context, AppItem app) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.6),
      builder: (context) {
        return AppDetailsDialog(app: app);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Featured Apps",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 50),
              ScreenHelper(
                desktop: _buildDesktopView(),
                tablet: _buildTabletView(),
                mobile: _buildMobileView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopView() {
    return Column(
      children: apps.asMap().entries.map((entry) {
        final index = entry.key;
        final app = entry.value;
        final isEven = index % 2 == 0;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // For even index: Image on left, content on right
              // For odd index: Content on left, image on right
              if (isEven) ...[
                Expanded(
                  flex: 1,
                  child: _buildImage(app),
                ),
                SizedBox(width: 40),
                Expanded(
                  flex: 1,
                  child: _buildContent(app),
                ),
              ] else ...[
                Expanded(
                  flex: 1,
                  child: _buildContent(app),
                ),
                SizedBox(width: 40),
                Expanded(
                  flex: 1,
                  child: _buildImage(app),
                ),
              ],
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTabletView() {
    return Column(
      children: apps.map((app) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          children: [
            _buildImage(app, 400),
            SizedBox(height: 30),
            _buildContent(app),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildMobileView() {
    return Column(
      children: apps.map((app) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 20),
        child: Column(
          children: [
            _buildImage(app, 300),
            SizedBox(height: 20),
            _buildContent(app),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildImage(AppItem app, [double? width]) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        constraints: BoxConstraints(maxWidth: width ?? 350.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: app.primaryColor.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 5,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(app.image, fit: BoxFit.contain),
        ),
      ),
    );
  }

  Widget _buildContent(AppItem app) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: app.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: app.primaryColor.withOpacity(0.3),
            ),
          ),
          child: Text(
            app.tagline,
            style: GoogleFonts.poppins(
              color: app.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
              letterSpacing: 0.5,
            ),
          ),
        ),
        SizedBox(height: 15.0),
        Text(
          app.title,
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 35.0,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          app.description,
          style: TextStyle(
            color: kCaptionColor,
            height: 1.6,
            fontSize: 16.0,
            letterSpacing: 0.3,
          ),
        ),
        SizedBox(height: 30.0),
        Row(
          children: [
            _buildActionButton(
              text: "EXPLORE MORE",
              backgroundColor: app.primaryColor,
              textColor: Colors.white,
              onPressed: () => _showAppDetailsDialog(context, app),
            ),
            /*SizedBox(width: 15.0),
            _buildActionButton(
              text: "VIEW CODE",
              backgroundColor: Colors.transparent,
              textColor: app.primaryColor,
              borderColor: app.primaryColor,
            ),*/
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    Color borderColor = Colors.transparent,
    VoidCallback? onPressed,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: borderColor, width: 2),
          boxShadow: [
            BoxShadow(
              color: backgroundColor.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        height: 52.0,
        padding: EdgeInsets.symmetric(horizontal: 32.0),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

class AppDetailsDialog extends StatefulWidget {
  final AppItem app;

  const AppDetailsDialog({Key? key, required this.app}) : super(key: key);

  @override
  _AppDetailsDialogState createState() => _AppDetailsDialogState();
}

class _AppDetailsDialogState extends State<AppDetailsDialog> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;
  bool _isMobile = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);

    _animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenWidth = MediaQuery.of(context).size.width;
    _isMobile = screenWidth < 700;
    _pageController = PageController(
      viewportFraction: _isMobile ? 0.85 : 0.7,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onClose() {
    _animationController.reverse().then((_) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    _isMobile = screenSize.width < 700;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: _isMobile ? 20 : 40,
        vertical: _isMobile ? 20 : 40,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Opacity(
              opacity: _fadeAnimation.value,
              child: child,
            ),
          );
        },
        child: Stack(
          children: [
            // Blurred Backdrop with Glass Morphism Effect
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),

            // Glass Morphism Container
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900]!.withOpacity(0.7),
                    ),
                    padding: EdgeInsets.all(_isMobile ? 20 : 32),
                    child: Column(
                      children: [
                        // Header Section
                        _buildHeader(),
                        SizedBox(height: _isMobile ? 16 : 24),

                        // Content Area
                        Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Description
                                _buildDescription(),
                                SizedBox(height: _isMobile ? 24 : 32),

                                // Screenshot Gallery
                                if (widget.app.screenshots.isNotEmpty)
                                  _buildScreenshotGallery(),

                                SizedBox(height: _isMobile ? 24 : 32),

                                // Features & Actions
                                _buildFeaturesAndActions(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Close Button
            Positioned(
              top: 16,
              right: 16,
              child: _buildCloseButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // App Icon/Image
        Container(
          width: _isMobile ? 60 : 80,
          height: _isMobile ? 60 : 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: widget.app.primaryColor.withOpacity(0.1),
            border: Border.all(
              color: widget.app.primaryColor.withOpacity(0.3),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.app.primaryColor.withOpacity(0.2),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              widget.app.image,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SizedBox(width: _isMobile ? 16 : 20),

        // Title and Tagline
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.app.title,
                style: GoogleFonts.oswald(
                  fontSize: _isMobile ? 24 : 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: widget.app.primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: widget.app.primaryColor.withOpacity(0.4),
                  ),
                ),
                child: Text(
                  widget.app.tagline,
                  style: GoogleFonts.poppins(
                    color: widget.app.primaryColor,
                    fontSize: _isMobile ? 12 : 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About the App",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: _isMobile ? 18 : 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
        Text(
          widget.app.description,
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: _isMobile ? 14 : 16,
            height: 1.6,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }

  Widget _buildScreenshotGallery() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Screenshots",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: _isMobile ? 18 : 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16),

        // Screenshot Carousel
        Container(
          height: _isMobile ? 300 : 400,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: widget.app.screenshots.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double value = 1.0;
                      if (_pageController.position.haveDimensions) {
                        value = _pageController.page! - index;
                        value = (1 - (value.abs() * 0.3)).clamp(0.7, 1.0);
                      }

                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 2,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          widget.app.screenshots[index],
                          fit: BoxFit.fitHeight, // Changed from fitHeight to contain
                          // width: double.infinity, // Added width constraint
                          // height: 600, // Added height constraint
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[800],
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.broken_image,
                                      color: Colors.white54,
                                      size: 50,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Image not found",
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
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

              // Navigation Arrows
              if (!_isMobile && widget.app.screenshots.length > 1) ...[
                Positioned(
                  left: 10,
                  child: _buildNavigationArrow(isLeft: true),
                ),
                Positioned(
                  right: 10,
                  child: _buildNavigationArrow(isLeft: false),
                ),
              ],
            ],
          ),
        ),
        SizedBox(height: 16),

        // Page Indicators
        if (widget.app.screenshots.length > 1)
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
                  width: _currentPage == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? widget.app.primaryColor
                        : Colors.white30,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: _currentPage == index ? [
                      BoxShadow(
                        color: widget.app.primaryColor.withOpacity(0.5),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ] : null,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildNavigationArrow({required bool isLeft}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (isLeft) {
            _pageController.previousPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          } else {
            _pageController.nextPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          child: Icon(
            isLeft ? Icons.arrow_back_ios_rounded : Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesAndActions() {
    return Column(
      children: [
        // Action Buttons
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                text: "LIVE DEMO",
                icon: Icons.play_arrow_rounded,
                backgroundColor: widget.app.primaryColor,
                onPressed: () {
                 widget.app.liveDemoUrl.isNotEmpty ? launchUrl(Uri.parse(widget.app.liveDemoUrl)) : null;
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 16),

        // Additional Info
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfoItem(
                icon: Icons.collections_rounded,
                value: "${widget.app.screenshots.length}",
                label: "Screens",
              ),
              _buildInfoItem(
                icon: Icons.palette_rounded,
                value: "Flutter",
                label: "Framework",
              ),
              _buildInfoItem(
                icon: Icons.phone_iphone_rounded,
                value: "iOS & Android",
                label: "Platform",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String text,
    required IconData icon,
    required Color backgroundColor,
    Color borderColor = Colors.transparent,
    Color textColor = Colors.white,
    VoidCallback? onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: borderColor,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: backgroundColor.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: textColor, size: 20),
              SizedBox(width: 8),
              Text(
                text,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Icon(icon, color: widget.app.primaryColor, size: 20),
        SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.white54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildCloseButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _onClose,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: Icon(
            Icons.close_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}

class AppItem {
  final String title;
  final String tagline;
  final String description;
  final String image;
  final List<String> screenshots;
  final Color primaryColor;
  final String liveDemoUrl;

  AppItem({
    required this.title,
    required this.tagline,
    required this.description,
    required this.image,
    required this.screenshots,
    required this.primaryColor,
    required this.liveDemoUrl,
  });
}