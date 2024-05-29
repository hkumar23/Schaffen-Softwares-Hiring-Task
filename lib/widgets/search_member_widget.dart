import 'package:flutter/material.dart';
import 'package:schaffensoftwares/widgets/profile_item.dart';

class SearchMemberWidget extends StatelessWidget {
  const SearchMemberWidget({
    required this.isSearchVisible,
    required this.onSearchVisible,
    super.key,
  });
  final bool isSearchVisible;
  final Function onSearchVisible;
  @override
  Widget build(BuildContext context) {
    List<ProfileItem> items = [
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
    ];
    return Column(
      children: [
        if (!isSearchVisible)
          ListTile(
            title: Text(
              "Members",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
            ),
            trailing: GestureDetector(
              onTap: () => onSearchVisible(),
              child: Container(
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
          ),
        if (isSearchVisible)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Member",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => onSearchVisible(),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        ),
      ],
    );
  }
}
