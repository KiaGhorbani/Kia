// ignore_for_file: use_key_in_widget_constructors, camel_case_types, file_names, prefer_const_constructors, deprecated_member_use, unnecessary_import, sized_box_for_whitespace, non_constant_identifier_names, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:techblog/Models/Data_Models.dart';
import 'package:techblog/Models/fakedata.dart';
import 'package:techblog/MyColors.dart';
import 'package:techblog/MyStrings.dart';
import 'package:techblog/gen/assets.gen.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double AppAlignment = size.width / 10;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: SolidColors.ScaffoldBg,
          //Mainpage UpperMenu
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Image(
                image: Assets.images.logo.provider(),
                height: size.height / 13.6,
              ),
              Icon(
                Icons.search,
                color: Colors.black,
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Stack(
            children: [
              HomePage(
                  size: size, texttheme: texttheme, AppAlignment: AppAlignment),
              //BottomNavigationBar
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: size.height / 13,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: GradientColors.BottomNavBG,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: AppAlignment, left: AppAlignment),
                    child: Container(
                      height: size.height / 6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          gradient: LinearGradient(
                              colors: GradientColors.BottomNav,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: ImageIcon(
                                  Assets.icons.bottomNavHome.provider(),
                                  color: Colors.white,
                                  size: 30)),
                          IconButton(
                              onPressed: () {},
                              icon: ImageIcon(
                                  Assets.icons.bottomNavWrite.provider(),
                                  color: Colors.white,
                                  size: 30)),
                          IconButton(
                              onPressed: () {},
                              icon: ImageIcon(
                                  Assets.icons.bottomNavUser.provider(),
                                  color: Colors.white,
                                  size: 30)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.size,
    required this.texttheme,
    required this.AppAlignment,
  });

  final Size size;
  final TextTheme texttheme;
  final double AppAlignment;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          //Mainpage Poster
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  width: size.width / 1.25,
                  height: size.height / 4.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: AssetImage(Posterwidgets["Poster Image"]),
                          fit: BoxFit.cover)),
                  foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: GradientColors.HomePosterCoverGradient,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                ),
                Positioned(
                  bottom: 8,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            Posterwidgets["Author"] +
                                " - " +
                                Posterwidgets["Publish Time"],
                            style: texttheme.subtitle1,
                          ),
                          Row(
                            children: [
                              Text(
                                Posterwidgets["Views"],
                                style: texttheme.subtitle1,
                              ),
                              SizedBox(width: 4),
                              Icon(
                                CupertinoIcons.eye_fill,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            Posterwidgets["Summary"],
                            style: texttheme.headline1,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          //Mainpage HashtagList
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: Hashtaglist.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 8, index == 0 ? AppAlignment : 20, 8),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          gradient: LinearGradient(
                              colors: GradientColors.HashtagsColor,
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                        child: Row(
                          children: [
                            ImageIcon(
                              Assets.icons.hashtag.provider(),
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(Hashtaglist[index].Title,
                                style: texttheme.headline2)
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),
          //مشاهده ی داغ ترین نوشته ها
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.only(right: AppAlignment),
            child: Row(
              children: [
                ImageIcon(
                  Assets.icons.bluePen.provider(),
                  color: SolidColors.MainPageTopics,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  Strings.HotBlogs,
                  style: texttheme.headline3,
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          //لیستی از مقالات داغ
          SizedBox(
            height: size.height / 4.1,
            child: ListView.builder(
              itemCount: BlogList.getRange(0, 6).length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: index == 0 ? AppAlignment : 15),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: size.height / 5.3,
                            width: size.width / 2.5,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          BlogList[index].ImageURL),
                                      fit: BoxFit.cover)),
                              foregroundDecoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  gradient: LinearGradient(
                                      colors: GradientColors.BlogListGradient,
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter)),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 0,
                            left: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  BlogList[index].Writer,
                                  style: texttheme.subtitle1,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      BlogList[index].Views,
                                      style: texttheme.subtitle1,
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      CupertinoIcons.eye_fill,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: index == 0 ? AppAlignment : 15),
                      child: SizedBox(
                        width: size.width / 2.5,
                        child: Text(
                          BlogList[index].Title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),

          //لیستی از پادکست های داغ
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.only(right: AppAlignment),
            child: Row(
              children: [
                ImageIcon(
                  Assets.icons.bluePodcast.provider(),
                  color: SolidColors.MainPageTopics,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  Strings.Hotpodcasts,
                  style: texttheme.headline3,
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: size.height / 4.1,
            child: ListView.builder(
              itemCount: PodcastList.getRange(0, 4).length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: index == 0 ? AppAlignment : 15),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: size.height / 5.3,
                            width: size.width / 2.5,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  image: DecorationImage(
                                      image: (PodcastList[index].ImageURL),
                                      fit: BoxFit.cover)),
                              foregroundDecoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  gradient: LinearGradient(
                                      colors: GradientColors.BlogListGradient,
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter)),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 0,
                            left: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  PodcastList[index].Writer,
                                  style: texttheme.subtitle1,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      PodcastList[index].Views,
                                      style: texttheme.subtitle1,
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      CupertinoIcons.eye_fill,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: index == 0 ? AppAlignment : 15),
                      child: SizedBox(
                        width: size.width / 2.5,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            PodcastList[index].Title,
                            style: texttheme.headline4,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}
