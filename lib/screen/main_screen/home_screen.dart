import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../model/cloth_item_model.dart';
import '../../model/cloth_item_model_content.dart';
import '../../model/silder_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SliderModel _sliderModel = SliderModel();
  late PageController _pageController;
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    _pageController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutQuad,
      );
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: Color(0xffF2F2F2),
          child: Icon(Icons.sort),
          minRadius: 5,
          maxRadius: 5,
        ),
        centerTitle: true,
        title: Image.asset("assets/images/main_screen_images/logo2.png"),
        actions: [
          CircleAvatar(
            backgroundImage:
                AssetImage("assets/images/main_screen_images/profile.png"),
            radius: 20,
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              buildSearchBar(),
              SizedBox(height: 20.h),
              buildFeaturedTile(),
              SizedBox(height: 10.h),
              buildImageSlider(),
              SizedBox(height: 15.h),
              buildIndicator(),
              SizedBox(height: 15.h),
              buildDealTile(),
              SizedBox(height: 15.h),
              buildGridView(),
              SizedBox(height: 15.h),
              buildOffersTile(),
              SizedBox(height: 20.h),
              buildOffersTileTWo(),
              SizedBox(height: 20.h),
              buildTradingTile(),
              SizedBox(height: 20.h),
              buildGridViewSecond(),
              SizedBox(height: 15.h),
              buildSalesTile(),
              SizedBox(height: 15.h),
              buildSponserTile(),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search any product...',
        hintStyle: TextStyle(
          color: Color(0xffBBBBBB),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Color(0xffBBBBBB),
        ),
        suffixIcon: Icon(
          Icons.mic_none_sharp,
          color: Color(0xffBBBBBB),
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget buildFeaturedTile() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "All Featured",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.25),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Text(
                    "Sort",
                  ),
                  SvgPicture.asset(
                    "assets/svg/sort.svg",
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Text(
                    "Filter",
                  ),
                  SvgPicture.asset(
                    "assets/svg/filter.svg",
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/home_screen_images/fe1.png"),
                  minRadius: 30,
                  maxRadius: 30,
                ),
                Text("Beauty"),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/home_screen_images/fe2.png"),
                  minRadius: 30,
                  maxRadius: 30,
                ),
                Text("Fashion"),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/home_screen_images/fe3.png"),
                  minRadius: 30,
                  maxRadius: 30,
                ),
                Text("Kids"),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/home_screen_images/fe4.png"),
                  minRadius: 30,
                  maxRadius: 30,
                ),
                Text("Mens"),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/home_screen_images/fe5.png"),
                  minRadius: 30,
                  maxRadius: 30,
                ),
                Text("Womens"),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget buildImageSlider() {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index % _sliderModel.images.length;
          });
        },
        itemBuilder: (context, index) {
          final int pageIndex = index % _sliderModel.images.length;
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              _sliderModel.images[pageIndex],
              height: 20,
              width: 100,
              fit: BoxFit.fitWidth,
            ),
          );
        },
      ),
    );
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _sliderModel.images.length,
        (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            width: _currentIndex == index ? 8.w : 8.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: _currentIndex == index
                  ? Color(0xffFFA3B3)
                  : Color(0xffDEDEDE),
              borderRadius: BorderRadius.circular(4),
            ),
          );
        },
      ),
    );
  }

  Widget buildDealTile() {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      tileColor: Color(0xff4392F9),
      title: Text(
        "Deal of the Day",
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Row(
        children: [
          Icon(FontAwesomeIcons.clock, color: Colors.white),
          SizedBox(
            width: 10.w,
          ),
          Text(
            "22h 55m 20s Remain",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "View All",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 4.w),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget buildGridView() {
    final clothItemsModel = ClothItemsModel();
    final items = clothItemsModel.clothModelItems;
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 2.1,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return buildClothItem(items[index]);
        },
      ),
    );
  }

  Widget buildClothItem(ClothModelItem clothModelItems) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              clothModelItems.imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clothModelItems.title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  clothModelItems.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '₹${clothModelItems.price}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Row(
                  children: [
                    Text(
                      '₹${clothModelItems.originalPrice}',
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 3),
                    Text(
                      '${clothModelItems.discountPercentage}% Off',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 4),
                    Text('${clothModelItems.rating}'),
                    SizedBox(width: 4),
                    Text('(${clothModelItems.reviewCount})'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOffersTile() {
    return ListTile(
      tileColor: Colors.white,
      leading: Image.asset("assets/images/main_screen_images/offer.png"),
      title: Row(
        children: [
          Text("Special Offers",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
          SizedBox(width: 05.w),
          Image.asset(
            "assets/images/main_screen_images/emoji.png",
          ),
        ],
      ),
      subtitle: Text(
        "We make sure you get the offer you need at best prices",
        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
      ),
    );
  }

  Widget buildOffersTileTWo() {
    return Image.asset("assets/images/main_screen_images/mac.png");
  }

  Widget buildTradingTile() {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      tileColor: Color(0xffFD6E86),
      title: Text(
        "Trending Products",
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Row(
        children: [
          Icon(FontAwesomeIcons.calendar, color: Colors.white),
          SizedBox(
            width: 10.w,
          ),
          Text(
            "Last Date 29/02/22",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "View All",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 4.w),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget buildGridViewSecond() {
    final clothItemsModel = ClothItemsModel();
    final items = clothItemsModel.clothModelItems;
    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 1.80,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return buildClothItemSecond(items[index]);
        },
      ),
    );
  }

  Widget buildClothItemSecond(ClothModelItem clothModelItems) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              clothModelItems.imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clothModelItems.title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  '₹${clothModelItems.price}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Row(
                  children: [
                    Text(
                      '₹${clothModelItems.originalPrice}',
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 3),
                    Text(
                      '${clothModelItems.discountPercentage}% Off',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSalesTile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/images/main_screen_images/sale.png"),
        Text(
          "New Arrivals",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Summer’ 25 Collections"),
            Container(
              alignment: Alignment.center,
              width: 100.w,
              decoration: BoxDecoration(
                color: Color(0xffF83758),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 4.w),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildSponserTile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sponserd",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
        ),
        Image.asset("assets/images/main_screen_images/sponser.png"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "up to 50% Off",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(width: 4.w),
            Icon(Icons.arrow_right, color: const Color.fromARGB(255, 0, 0, 0)),
          ],
        ),
      ],
    );
  }
}
