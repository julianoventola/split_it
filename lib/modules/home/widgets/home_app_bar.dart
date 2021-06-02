import 'package:flutter/material.dart';
import 'package:split_it/modules/home/models/info_card_model.dart';
import 'package:split_it/modules/home/widgets/home_add_button.dart';

import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

import 'home_info_card.dart';

class AppBarWidget extends PreferredSize {
  final BuildContext context;
  final UserModel user;
  final VoidCallback addButtonOnTap;
  final InfoCardModel infoCardModel;

  AppBarWidget({
    required this.user,
    required this.addButtonOnTap,
    required this.context,
    required this.infoCardModel,
  }) : super(
          preferredSize: Size.fromHeight(328),
          child: Stack(
            children: [
              Container(
                color: AppTheme.colors.backgroundSplash,
                child: SafeArea(
                  child: Container(
                    padding: EdgeInsets.only(top: 32, left: 16, right: 16),
                    height: 128 + 84,
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
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 32 + 40 + 56),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeInfoCard(
                      value: infoCardModel.receive,
                    ),
                    SizedBox(width: 15),
                    HomeInfoCard(
                      value: infoCardModel.send,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
}
