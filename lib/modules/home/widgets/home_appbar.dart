import 'package:flutter/material.dart';

import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  AppBarWidget({required this.user})
      : super(
          preferredSize: Size.fromHeight(244),
          child: Container(
            color: AppTheme.colors.backgroundSplash,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.only(top: 32),
                height: 214,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      user.photoUrl!,
                    ),
                  ),
                  title: Text(
                    user.name!,
                    style: AppTheme.textStyle.appbarName,
                  ),
                  trailing: Container(
                    height: 56,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppTheme.colors.borderButton,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
}
