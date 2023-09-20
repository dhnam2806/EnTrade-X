import 'package:entradex/Menu/search_screen.dart';
import 'package:entradex/widgets/search.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final safePadding = MediaQuery.of(context).padding.top;

    return Container(
      height: size.height * 0.24,
      padding: EdgeInsets.only(top: safePadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          color: Colors.grey[900]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    print('Search');
                  },
                  child: SearchWidget()),
              IconButton(
                onPressed: () {
                  print('Light');
                },
                icon: Icon(Icons.lightbulb),
                color: Colors.yellow,
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/john-wick.jpg'),
                ),
              ),
              Text(
                'John Wick',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
