import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main_screen/chat_screen.dart';
import '../main_screen/home_screen.dart';
import '../main_screen/whishlist_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentTabIndex = 0;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomeScreen(),
      WishlistScreen(),
      // CartScreen(),
      // ProfileScreen(

      // ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(180.w),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        ),
        child: Icon(
          Icons.shopping_cart,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      body: pages[currentTabIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentTabIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  CustomBottomNavBar({
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.w,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 0, "Home"),
            _buildNavItem(Icons.favorite, 1, "Wishlist"),
            SizedBox(width: 50.w),
            _buildNavItem(Icons.search, 2, "Search"),
            _buildNavItem(Icons.person, 3, "Setting"),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, String lable) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:
                currentIndex == index ? Color(0xffF83758) : Color(0xff000000),
          ),
          Text(
            lable,
            style: TextStyle(
              color:
                  currentIndex == index ? Color(0xffF83758) : Color(0xff000000),
            ),
          )
        ],
      ),
    );
  }
}
