import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  String selectedSize = '7 UK';

  final List<String> images = [
    'assets/images/wishlist_screen_images/1.png',
    'assets/images/wishlist_screen_images/2.png',
    'assets/images/wishlist_screen_images/3.png',
    'assets/images/wishlist_screen_images/4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildProductImageSection(),
          SizedBox(height: 16),
          buildSizeSelection(),
          SizedBox(height: 16),
          buildProductDetails(),
          SizedBox(height: 16),
          buildActionButtons(),
          SizedBox(height: 16),
          buildDeliveryInfo(),
          SizedBox(height: 16),
          buildSimilarItemsSection(),
        ],
      ),
    );
  }

  Widget buildProductImageSection() {
    return Padding(
      padding: EdgeInsets.all(16.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      _pageController.animateToPage(
                        selectedIndex,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      height: 100,
                      images[index],
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    _pageController.animateToPage(
                      selectedIndex,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor:
                        selectedIndex == index ? Colors.red : Colors.grey,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget buildSizeSelection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var size in ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'])
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ChoiceChip(
                  selectedColor: Color(0xffFA7189),
                  showCheckmark: false,
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  label: Text(size),
                  selected: size == selectedSize,
                  onSelected: (selected) {
                    setState(() {
                      selectedSize = size;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildProductDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nike Sneakers',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Vision Alta Men\'s Shoes Size (All Colours)',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20),
              Icon(Icons.star, color: Colors.amber, size: 20),
              Icon(Icons.star, color: Colors.amber, size: 20),
              Icon(Icons.star, color: Colors.amber, size: 20),
              Icon(Icons.star_half, color: Colors.amber, size: 20),
              SizedBox(width: 8),
              Text('56,890'),
            ],
          ),
          Row(
            children: [
              Text(
                '₹2,999',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 8),
              Text(
                '₹1,500',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Text(
                '50% Off',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Product Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Perhaps the most iconic sneaker of all-time, this original "Chicago" colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the ...',
          ),
        ],
      ),
    );
  }

  Widget buildActionButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              label: Text(
                'Go to cart',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag, color: Colors.white),
              label: Text(
                'Buy Now',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDeliveryInfo() {
    return Container(
      color: Colors.pink[50],
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(Icons.delivery_dining, color: Colors.pink),
          SizedBox(width: 8),
          Text(
            'Delivery in \n1 within Hour',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget buildSimilarItemsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Similar To',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                "258+ Items",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 80.w),
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
          SizedBox(height: 15.h),
          SimilarItemsList(),
        ],
      ),
    );
  }
}

class SimilarItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/wishlist_screen_images/1.png",
                          height: 100),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nike Sneakers',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Nike Air Jordan Retro 1 \nLow Mystic Black',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              Icon(Icons.star_half,
                                  color: Colors.amber, size: 20),
                              SizedBox(width: 8),
                              Text('46,890'),
                            ],
                          ),
                          Text(
                            '₹1,900',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/wishlist_screen_images/2.png",
                        height: 100,
                        width: 100,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nike Sneakers',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Nike Air Jordan Retro 1 \nLow Mystic Black',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              Icon(Icons.star_half,
                                  color: Colors.amber, size: 20),
                              SizedBox(width: 8),
                              Text('46,890'),
                            ],
                          ),
                          Text(
                            '₹1,900',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
