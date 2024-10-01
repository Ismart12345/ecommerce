import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/views/screens/widgets/banners_widget.dart';
import 'package:shop_app/views/screens/widgets/category_text_widget.dart';
import 'package:shop_app/views/screens/widgets/home_products.dart';
import 'package:shop_app/views/screens/widgets/mens_product_widget.dart';
import 'package:shop_app/views/screens/widgets/resuse_text.dart';
import 'package:shop_app/views/screens/widgets/womens_product_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            BannerWidget(),
            SizedBox(
              height: 10,
            ),
            CategoryTextWidget(),
            SizedBox(
              height: 10,
            ),
            HomeProductWidget(),
            SizedBox(
              height: 10,
            ),
            ReuseTextWidget(title: 'Men\'s Products'),
            SizedBox(
              height: 10,
            ),
            MensProductWidget(),
            SizedBox(
              height: 10,
            ),
            ReuseTextWidget(title: 'Women\'s Products'),
            WomenProductWidget(),
          ],
        ),
      ),
    );
  }
}
