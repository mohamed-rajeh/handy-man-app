// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:ser/app/services/get_serviecs.dart';
import 'package:ser/app/view/pages/home/notifications_page.dart';
import 'package:ser/components/constant/them.dart';

import '../../../../components/shared/my_lable.dart';
import '../../widget/home/ad_widget.dart';
import '../../widget/home/category_header_delegate.dart';
import '../../widget/home/items_sliver_gride.dart';
import '../../widget/home/sections.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  GetServicesController serviceController = Get.put(GetServicesController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 46,
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      style: TextStyle(fontSize: 16, color: MyThem.black),
                      cursorHeight: 30,
                      cursorColor: MyThem.white,
                      controller: controller,
                      onChanged: (value) => setState(() {}),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: MyThem.primaryColor,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "Search",
                          hintStyle:
                              MyThem.nfontStyle.copyWith(color: MyThem.grey),
                          // clear feild
                          suffixIcon: controller.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      controller.clear();
                                    });
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                    color: MyThem.accentColor,
                                  ),
                                )
                              : null,
                          prefixIcon: Icon(
                            Icons.search,
                            color: MyThem.secondaryColor,
                            size: 30,
                          )),
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    // natefcion
                    InkWell(
                      onTap: () => Get.to(NotificationsPage()),
                      child: Icon(
                        Icons.notifications_on,
                        color: MyThem.accentColor,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 450,
                      flexibleSpace: FlexibleSpaceBar(
                          background: Column(
                        children: [
                          SizedBox(height: 20),
                          // ADs
                          AdWidget(),
                          SizedBox(height: 20),
                          //  Sections part
                          Sections(),
                          //End  Sections part
                        ],
                      )),
                    ),
                    // Catogrys items

                    SliverPersistentHeader(
                      pinned: true,
                      floating: false,
                      delegate: CategoryHeaderDelegate(),
                    ),
                    // // End Catogrys items

                    // puplur items and more
                    GetBuilder<GetServicesController>(builder: (context) {
                      List s = serviceController.services;
                      if (serviceController.isAll.isFalse) {
                        s = s
                            .where((element) =>
                                element.category ==
                                serviceController.selectedCategory.value)
                            .toList();
                      }

                      return HomePopruleItem(service: s);
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
