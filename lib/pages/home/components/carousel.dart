import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/pages/home/components/carousel_items.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double carouselHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);

    return SizedBox(
      height: carouselHeight,
      width: double.infinity,
      child: PageView.builder(
        controller: _pageController,
        itemCount: carouselItems.length,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        itemBuilder: (context, index) {
          return ScreenHelper(
            desktop: _buildDesktop(
              context,
              carouselItems[index].text,
              carouselItems[index].image,
            ),
            tablet: _buildTablet(
              context,
              carouselItems[index].text,
              carouselItems[index].image,
            ),
            mobile: _buildMobile(
              context,
              carouselItems[index].text,
              carouselItems[index].image,
            ),
          );
        },
      ),
    );
  }
}

// --- Your existing methods remain unchanged ---
Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: kDesktopMaxWidth,
      minWidth: kDesktopMaxWidth,
      defaultScale: false,
      child: Row(children: [Expanded(child: text), Expanded(child: image)]),
    ),
  );
}

Widget _buildTablet(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: kTabletMaxWidth,
      minWidth: kTabletMaxWidth,
      defaultScale: false,
      child: Row(children: [Expanded(child: text), Expanded(child: image)]),
    ),
  );
}

Widget _buildMobile(BuildContext context, Widget text, Widget image) {
  return Container(
    constraints: BoxConstraints(maxWidth: getMobileMaxWidth(context)),
    width: double.infinity,
    child: text,
  );
}
