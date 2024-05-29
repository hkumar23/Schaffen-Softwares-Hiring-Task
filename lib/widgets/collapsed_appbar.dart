import 'package:flutter/material.dart';

class CollapsedAppBar extends StatelessWidget {
  const CollapsedAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            backgroundImage: AssetImage("assets/image_01.png"),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "The Weeknd",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
              ),
              // const SizedBox(height: 2),
              Text(
                "Community • +11K Members",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.white,
                      letterSpacing: 0.2,
                      // fontSize: 9,
                    ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((context) => BottomSheet(
                    onClosing: () {},
                    builder: (context) => const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(Icons.link),
                              title: Text("Invite"),
                            ),
                            ListTile(
                              leading: Icon(Icons.person_add_alt_rounded),
                              title: Text("Add Member"),
                            ),
                            ListTile(
                              leading: Icon(Icons.group_add),
                              title: Text("Add Group"),
                            ),
                          ],
                        ))),
              );
            },
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
