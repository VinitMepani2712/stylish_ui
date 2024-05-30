import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/wishlist_item_model.dart';
import '../../model/wishlist_item_model_content.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
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
              SizedBox(height: 15.h),
              buildGridView(),
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
              "55,758+ Items",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.20),
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
      ],
    );
  }

  Widget buildGridView() {
    final wishListModelItems = WishListModel();
    final items = wishListModelItems.wishListModelItems;
    return Container(
      height: MediaQuery.of(context).size.height.h,
      child: GridView.builder(
        padding: EdgeInsets.only(bottom: 70.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 0.55,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return buildClothItem(items[index]);
        },
      ),
    );
  }

  Widget buildClothItem(WishListModelItems wishlistModelItems) {
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
              wishlistModelItems.imagePath,
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
                  wishlistModelItems.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  wishlistModelItems.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '₹${wishlistModelItems.price}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 4),
                    Text('${wishlistModelItems.rating}'),
                    SizedBox(width: 4),
                    Text('(${wishlistModelItems.reviewCount})'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
