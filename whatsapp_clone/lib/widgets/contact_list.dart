import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/mobile_chat_screen.dart';
import 'package:whatsapp_clone/widgets/colours.dart';
import 'info.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: info.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MobileChatScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        info[index]['name'].toString(),
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      subtitle: Text(
                        info[index]['message'].toString(),
                        style: const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(info[index]['profilePic'].toString()),
                      ),
                      trailing: Text(
                        info[index]['time'].toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: dividerColor,
                  indent: 85,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
