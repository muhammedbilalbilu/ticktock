import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:tiktok/controllers/searchController.dart';
import 'package:tiktok/models/user.dart';
import 'package:tiktok/views/screens/profileScreen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: TextFormField(
              decoration: InputDecoration(
                  filled: false,
                  hintText: 'Search',
                  helperStyle: TextStyle(fontSize: 18, color: Colors.white)),
              onFieldSubmitted: (value) => searchController.searchUser(value),
            ),
          ),
          body: searchController.searcheduser.isEmpty
              ? Center(
                  child: Text(
                    'Search for users',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                )
              : ListView.builder(
                  itemCount: searchController.searcheduser.length,
                  itemBuilder: (context, index) {
                    User user = searchController.searcheduser[index];
                    return InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfileScreen(uid: user.uid))),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.profilePhoto),
                        ),
                        title: Text(
                          user.name,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    );
                  }));
    });
  }
}
