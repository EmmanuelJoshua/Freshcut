import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freshcut_test/models/playlist_item_model.dart';
import 'package:freshcut_test/utils/utils.dart';
import 'package:freshcut_test/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List of playlists
  List<PlaylistItemModel> items = [
    PlaylistItemModel(
        title: 'Smash Stockpile',
        image: ImageAssets.image1,
        newVideos: 10,
        totalVideos: 30,
        watchedVideos: 15,
        progress: 0.55,
        dominantColor: kSunGold.withOpacity(0.3),
        isPlaylistCompleted: false),
    PlaylistItemModel(
        title: 'FGC Rumble',
        image: ImageAssets.image2,
        newVideos: 18,
        totalVideos: 18,
        watchedVideos: 0,
        progress: 0,
        dominantColor: const Color(0xFFA823EA).withOpacity(0.3),
        isPlaylistCompleted: false),
    PlaylistItemModel(
        title: 'Valorant Volume',
        image: ImageAssets.image3,
        newVideos: 21,
        totalVideos: 21,
        watchedVideos: 21,
        progress: 1,
        dominantColor: const Color(0xFFC30912).withOpacity(0.3),
        isPlaylistCompleted: true),
  ];

  //For bottom nav bar
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const Gap(80),

                //Header text
                Row(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.zero,
                      child: const GradientText(
                        text: 'Trending Today',
                        style: TextStyle(
                          fontSize: 34,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w700,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            kSunGold,
                            Color(0xFFD93636),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 7, left: 5),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        '🔥',
                        style: TextStyle(fontSize: 40),
                      ),
                    )
                  ],
                ),

                //Playlist list builder
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  shrinkWrap: true,
                  separatorBuilder: (_, i) => const Gap(32),
                  itemBuilder: (_, i) {
                    final model = items[i];
                    return PlaylistItem(
                      model: model,
                    );
                  },
                ),

                const Gap(10),

                //Verification Gif
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 400,
                    child: Image.asset(
                      ImageAssets.verificationGif,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Text(
                  'Check back soon for new clips and creator content.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
                const Gap(8),
                const Text(
                  'In the meantime join our discord.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFA19DAA),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                const Gap(40),
                GradientButton(
                  text: 'Join Metaview Discord',
                  icon: Center(
                    child: SvgPicture.asset(
                      ImageAssets.discordIcon,
                      width: 28,
                    ),
                  ),
                ),
                const Gap(120),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 6.5,
                  sigmaY: 6.5,
                ),
                child: Container(
                  height: 88,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: black.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    type: BottomNavigationBarType.fixed,
                    showUnselectedLabels: false,
                    selectedLabelStyle: const TextStyle(fontSize: 12),
                    fixedColor: kSunGold,
                    currentIndex: _currentIndex,
                    onTap: (val) {
                      setState(() {
                        _currentIndex = val;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                        label: "Hot",
                        icon: SvgPicture.asset(
                          ImageAssets.fireIcon,
                          height: 40,
                          width: 40,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Discover",
                        icon: Container(
                          margin: const EdgeInsets.only(bottom: 3),
                          child: SvgPicture.asset(
                            ImageAssets.discoverIcon,
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Watch",
                        icon: Container(
                          margin: const EdgeInsets.only(bottom: 3),
                          child: SvgPicture.asset(
                            ImageAssets.watchIcon,
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Inbox",
                        icon: Container(
                          margin: const EdgeInsets.only(bottom: 3),
                          child: SvgPicture.asset(
                            ImageAssets.inboxIcon,
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Profile",
                        icon: Container(
                          margin: const EdgeInsets.only(bottom: 3),
                          child: SvgPicture.asset(
                            ImageAssets.profileIcon,
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
