// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:tiktok/controllers/commedcontroller.dart';

class CommentScreen extends StatelessWidget {
  String id;
  CommentScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final TextEditingController commentcontroller = TextEditingController();
  CommentController commentControllersent = CommentController();

  @override
  Widget build(BuildContext context) {
    commentControllersent.updatePostid(id);
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: SizedBox(
        width: Size.width,
        height: Size.height,
        child: Column(
          children: [
            Expanded(child: Obx(() {
              return ListView.builder(
                  itemCount: commentControllersent.Comments.length,
                  itemBuilder: (context, index) {
                    final comment = commentControllersent.Comments[index];
                    return Expanded(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage(comment.profilePhoto),
                        ),
                        title: Row(
                          children: [
                            Text(
                              comment.username,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              comment.comment,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              'data',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              " ${comment.likes.length.toString()} likes",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            )
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  });
            })),
            Divider(),
            ListTile(
              title: TextFormField(
                controller: commentcontroller,
                style: TextStyle(fontSize: 16, color: Colors.white),
                decoration: InputDecoration(
                    labelText: 'Comment',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
              trailing: TextButton(
                  onPressed: () =>
                      commentControllersent.postComment(commentcontroller.text),
                  child: Text(
                    'Send',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
