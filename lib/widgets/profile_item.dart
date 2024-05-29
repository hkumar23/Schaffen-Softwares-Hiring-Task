import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    required this.isFollowing,
    super.key,
  });
  final bool isFollowing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage("assets/image_02.png"),
      ),
      title: const Text("Yashika"),
      subtitle: const Text("29, India"),
      trailing: FilledButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isFollowing
                ? const Color.fromARGB(255, 170, 171, 171)
                : const Color.fromARGB(255, 239, 69, 111),
          ),
        ),
        onPressed: () {},
        child: Container(
          height: 20,
          alignment: Alignment.center,
          width: 70,
          child: Text(isFollowing ? "Following" : "Add"),
        ),
      ),
    );
  }
}
