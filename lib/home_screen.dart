import 'package:flutter/material.dart';

import 'widgets/collapsed_appbar.dart';
import 'widgets/expandable_text.dart';
import 'widgets/expanded_appbar.dart';
import 'widgets/outdoor_item.dart';
import 'widgets/image_item.dart';
import 'widgets/mute_notification.dart';
import 'widgets/search_member_widget.dart';
import 'widgets/settings_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarExpanded = true;
  bool isSearchVisible = false;
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
                    ? const ExpandedAppBar()
                    : const CollapsedAppBar(),
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
                      : const Color.fromARGB(255, 170, 36, 34),
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
                    if (!isSearchVisible) const ExpandableText(),
                    if (!isSearchVisible)
                      const Padding(
                        padding:
                            EdgeInsets.only(bottom: 16, left: 16, right: 16),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              OutdoorItem(title: "Outdoor"),
                              OutdoorItem(title: "Outdoor"),
                              OutdoorItem(title: "Outdoor"),
                              OutdoorItem(title: "Outdoor"),
                              OutdoorItem(title: "+1"),
                            ],
                          ),
                        ),
                      ),
                    if (!isSearchVisible)
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
                    if (!isSearchVisible)
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
                    if (!isSearchVisible) const MuteNotification(),
                    if (!isSearchVisible)
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
                    SearchMemberWidget(
                      onSearchVisible: () {
                        setState(() {
                          isSearchVisible = !isSearchVisible;
                        });
                      },
                      isSearchVisible: isSearchVisible,
                    ),
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
