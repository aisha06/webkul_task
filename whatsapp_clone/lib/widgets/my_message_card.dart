import 'package:flutter/material.dart';
import 'package:whatsapp_clone/widgets/colours.dart';

class MyMessageCard extends StatelessWidget {
  final String message;
  final String date;
  const MyMessageCard({Key? key, required this.message, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: messageColor,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 40, bottom: 20, top: 15),
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      date,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(Icons.done_all_outlined,color: Colors.grey,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
