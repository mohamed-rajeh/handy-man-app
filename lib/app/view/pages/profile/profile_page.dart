// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../widget/profile/body_part.dart';
import '../../widget/profile/header_part.dart';
import '../../widget/profile/logout_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderPart(),
              SizedBox(height: 30),
              BodyPart(),
              Spacer(),
              LogOutButton(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
