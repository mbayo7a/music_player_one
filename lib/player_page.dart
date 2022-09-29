import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: 30,
            )),
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: 300,
          ),
          Container(
            color: Colors.yellow,
            height: 300,
          )
        ],
      ),
    );
  }
}
