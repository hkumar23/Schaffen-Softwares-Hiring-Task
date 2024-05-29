import 'package:flutter/material.dart';

import 'widgets/expandable_text.dart';
import 'widgets/outdoor_item.dart';
import 'widgets/image_item.dart';
import 'widgets/mute_notification.dart';
import 'widgets/profile_item.dart';
import 'widgets/settings_item.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarExpanded = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _isAppBarExpanded = _scrollController.hasClients &&
          _scrollController.offset < (250 - kToolbarHeight);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              // floating: true,
              // snap: true,
              flexibleSpace: FlexibleSpaceBar(
                // collapseMode: CollapseMode.pin,
                titlePadding: const EdgeInsets.all(0),
                title: _isAppBarExpanded
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // const Icon(Icons.account_circle,
                            //     size: 40.0, color: Colors.white,),
                            // const SizedBox(width: 16.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "The Weeknd",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: Colors.white),
                                ),
                                // const SizedBox(height: 2),
                                Text(
                                  "Community • +11K Members",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        letterSpacing: 0.2,
                                        fontSize: 9,
                                      ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(4),
                              child: const Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        // height: MediaQuery.of(context).size.height * 0.07,
                        // width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Row(
                          // mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // const Icon(Icons.account_circle,
                            //     size: 40.0, color: Colors.white,),
                            const SizedBox(width: 40),
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/image_01.png"),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "The Weeknd",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                ),
                                // const SizedBox(height: 2),
                                Text(
                                  "Community • +11K Members",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        color: Colors.white,
                                        letterSpacing: 0.2,
                                        // fontSize: 9,
                                      ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 211, 49, 38),
                              ),
                              padding: const EdgeInsets.all(4),
                              child: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                                // size: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                background: Image.asset(
                  "assets/image_01.png",
                  fit: BoxFit.cover,
                ),
              ),
              pinned: true,
              // title: ,
              backgroundColor: Colors.red,
              leading: Container(
                margin: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isAppBarExpanded
                      ? Colors.black
                      : const Color.fromARGB(255, 211, 49, 38),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ExpandableText(),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            OutdoorItem(),
                            OutdoorItem(),
                            OutdoorItem(),
                            OutdoorItem(),
                            OutdoorItem(),
                            OutdoorItem(),
                            OutdoorItem(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListTile(
                        title: Text(
                          "Media, docs and links",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ImageItem(),
                            ImageItem(),
                            ImageItem(),
                            ImageItem(),
                            ImageItem(),
                          ],
                        ),
                      ),
                    ),
                    const MuteNotification(),
                    const Column(
                      children: [
                        SettingsItem(
                          itemColor: Colors.black,
                          icon: Icons.delete_outline_rounded,
                          title: "Clear chat",
                        ),
                        SettingsItem(
                          itemColor: Colors.black,
                          icon: Icons.lock_outline_rounded,
                          title: "Encryption",
                        ),
                        SettingsItem(
                          itemColor: Colors.red,
                          icon: Icons.logout_outlined,
                          title: "Exit Community",
                        ),
                        SettingsItem(
                          itemColor: Colors.red,
                          icon: Icons.thumb_down_outlined,
                          title: "Report",
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text(
                        "Members",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.search,
                        ),
                      ),
                    ),
                    const ProfileItem(isFollowing: true),
                    const ProfileItem(isFollowing: false),
                    const ProfileItem(isFollowing: false),
                    const ProfileItem(isFollowing: false),
                    const ProfileItem(isFollowing: false),
                    const ProfileItem(isFollowing: false),
                    const ProfileItem(isFollowing: false),
                    const ProfileItem(isFollowing: false),
                    const ProfileItem(isFollowing: false),
                    const ProfileItem(isFollowing: false),
                    const ProfileItem(isFollowing: false),
                    const ProfileItem(isFollowing: false),
                    const ProfileItem(isFollowing: false),
                    const ProfileItem(isFollowing: false),
                    const ProfileItem(isFollowing: false),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
