import 'package:flutter/material.dart';
import 'package:freshcut_test/models/playlist_item_model.dart';
import 'package:freshcut_test/utils/utils.dart';

import 'linear_progress.dart';

class PlaylistItem extends StatelessWidget {
  const PlaylistItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  final PlaylistItemModel model;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      borderRadius: 32,
      width: double.infinity,
      height: 420,
      blur: 7,
      padding: const EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      border: 0.4,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            model.dominantColor,
            white.withOpacity(0.05),
          ],
          stops: const [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            kSunGold.withOpacity(0.2),
            const Color((0xFF28262C)).withOpacity(0.1),
          ],
          stops: const [
            0.2,
            0.8
          ]),
      child: Stack(
        children: [
          Column(
            children: [
              //Playlist image
              Container(
                margin: const EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width - 60,
                height: 288,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Image.asset(
                    model.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(20),
              //Playlist title
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 24,
                    ),
                    child: Text(
                      model.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  )
                ],
              ),
              const Gap(2),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          '+${model.newVideos} New Videos',
                          style: TextStyle(
                              color: model.isPlaylistCompleted
                                  ? const Color(0xFF645F6D)
                                  : kSunGold),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 3),
                            child: Center(
                              child: SvgPicture.asset(
                                ImageAssets.eyeIcon,
                                width: 18,
                                color: model.isPlaylistStarted
                                    ? kSunGold
                                    : const Color(0xFF8C8797),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              right: 25,
                            ),
                            child: Text(
                              '${model.watchedVideos}/${model.totalVideos}',
                              style: TextStyle(
                                color: model.isPlaylistStarted
                                    ? kSunGold
                                    : const Color(0xFF8C8797),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              const Gap(16),
              //Playlist progress bar
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 62,
                    child: LinearProgress(
                      progress: model.progress,
                    ),
                  )
                ],
              ),
            ],
          ),
          //Play button
          Positioned(
            right: 25,
            bottom: 83,
            child: Stack(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  margin: const EdgeInsets.only(left: 4, top: 2),
                  child: Center(
                    child: SvgPicture.asset(
                      ImageAssets.playIcon,
                      width: 41,
                    ),
                  ),
                ),
                GlassmorphicContainer(
                  width: 64,
                  height: 64,
                  borderRadius: 40,
                  blur: 4,
                  alignment: Alignment.bottomCenter,
                  border: 0.5,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        white.withOpacity(0.10),
                        white.withOpacity(0.05),
                      ],
                      stops: const [
                        0.1,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      white.withOpacity(0.3),
                      white.withOpacity(0.05),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 7, top: 6),
                    child: Center(
                      child: SvgPicture.asset(
                        ImageAssets.playIcon,
                        width: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
