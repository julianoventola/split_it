import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/home_add_button.dart';

import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final VoidCallback addButtonOnTap;

  AppBarWidget({required this.user, required this.addButtonOnTap})
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
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text(
                    // ternary: check name display
                    user.name!.contains(" ")
                        ? user.name!.split(" ")[0]
                        : user.name!,
                    style: AppTheme.textStyle.appbarName,
                  ),
                  trailing: HomeAddButton(
                    onTap: addButtonOnTap,
                  ),
                ),
              ),
            ),
          ),
        );
}
