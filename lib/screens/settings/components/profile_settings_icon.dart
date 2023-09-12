
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/profile_screen.dart';

class ProfileSettingsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    final user = UserPreferences.getUser();
    final image=user.imagePath.contains('https://')?NetworkImage(user.imagePath):FileImage(File(user.imagePath));
    return SimpleSettingsTile(title: user.name,subtitle: '+1 90211 44 44',leading:CircleAvatar(
      backgroundColor: Colors.white,
        radius: 20,
        backgroundImage: image as ImageProvider,

      ),child: const ProfileScreen(),
    );

  }
}
