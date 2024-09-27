import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Screens/chat_bot_entrance.dart';
import 'package:flutter_application_1/Screens/profile_data.dart';
import 'package:flutter_application_1/Widgets/custom_button.dart';

class Profile_main extends StatelessWidget {
  const Profile_main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: maincolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Profile'),
        centerTitle: false,
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatBotEntrance(),
                    ));
              },
              child: Icon(Icons.chat)),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),
            const CircleAvatar(
              radius: 64,
              backgroundImage:
                  AssetImage('assets/images/pexels-daliladalprat-1844547.jpg'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile_data(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: maincolor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 32),
            _buildSection(
              title: 'Account',
              children: const [
                _ProfileListItem(icon: Icons.star_border, title: 'Popular'),
                _ProfileListItem(icon: Icons.trending_up, title: 'Trending'),
              ],
            ),
            _buildSection(
              title: 'Content',
              children: const [
                _ProfileListItem(
                    icon: Icons.favorite_border, title: 'Favourite'),
                _ProfileListItem(icon: Icons.download, title: 'Download'),
              ],
            ),
            _buildSection(
              title: 'Preferences',
              children: const [
                _ProfileListItem(icon: Icons.language, title: 'Language'),
                _ProfileListItem(icon: Icons.brightness_2, title: 'Darkmode'),
                _ProfileListItem(
                    icon: Icons.wifi, title: 'Only Download via Wifi'),
              ],
            ),
            const SizedBox(height: 32),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.lightBlue,
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            //       textStyle: const TextStyle(fontSize: 18),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(25),
            //       ),
            //     ),
            //     child: const Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text('Log Out'),
            //         Icon(Icons.logout),
            //       ],
            //     ),
            //   ),
            // ),
            Custom_button(Bgcolor: maincolor, title: "LOG OUT"),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      {required String title, required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }
}

class _ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _ProfileListItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {},
    );
  }
}
