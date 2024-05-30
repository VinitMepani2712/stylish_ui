import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ui/Auth/login_screen.dart';

import '../../model/on_board_content_modal.dart';
import '../../../widget/widget_support.dart';
import '../welcome_screen/welcome_screen.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentIndex = 0;
  late PageController _controller = PageController();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  buildPageView(),
                  buildSkipIndicator(),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            buildNavigationRow(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget buildPageView() {
    return PageView.builder(
      controller: _controller,
      itemCount: onBoradingContentModel.length,
      onPageChanged: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      itemBuilder: (_, i) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.w),
                child: Image.asset(
                  onBoradingContentModel[i].image,
                  height: 250.h,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                onBoradingContentModel[i].title,
                textAlign: TextAlign.center,
                style: AppWidget.textStyle(),
              ),
              SizedBox(height: 20.h),
              Text(
                onBoradingContentModel[i].description,
                textAlign: TextAlign.center,
                style: AppWidget.lightTextStyle(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildSkipIndicator() {
    return Positioned(
      top: 45.h,
      right: 10.w,
      left: 10.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${currentIndex + 1}/${onBoradingContentModel.length}",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          if (currentIndex < onBoradingContentModel.length - 1)
            GestureDetector(
              onTap: () {
                _controller.jumpToPage(onBoradingContentModel.length - 1);
              },
              child: Center(
                child: Text(
                  "SKIP",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildNavigationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (currentIndex > 0)
          TextButton(
            onPressed: () {
              _controller.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: Text("Prev", style: AppWidget.onBoardbuttonTextStyleTwo()),
          ),
        Spacer(),
        buildDots(),
        Spacer(),
        if (currentIndex < onBoradingContentModel.length - 1)
          TextButton(
            onPressed: () {
              _controller.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: Text(
              "Next",
              style: AppWidget.onBoardbuttonTextStyle(),
            ),
          ),
        if (currentIndex == onBoradingContentModel.length - 1)
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            ),
            child: Text(
              "Get Started",
              style: AppWidget.onBoardbuttonTextStyle(),
            ),
          ),
      ],
    );
  }

  Widget buildDots() {
    return Row(
      children: List.generate(
        onBoradingContentModel.length,
        (index) => Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: buildDot(index),
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      height: 8.0.h,
      width: currentIndex == index ? 30.w : 8.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Color(0xff17223B) : Color(0xffD1D3D8),
      ),
    );
  }
}
