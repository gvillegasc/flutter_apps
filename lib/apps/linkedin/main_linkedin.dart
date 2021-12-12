import 'package:flutter/material.dart';

class MainLinkedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _MainLinkedIn();
  }
}

class _MainLinkedIn extends StatelessWidget {
  const _MainLinkedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _UserInfo(),
          _Histories(),
        ],
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 80,
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.blue,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Román Guinto',
                  style: TextStyle(
                    color: Color(0xff203556),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'FRONTEND DEVELOPER',
                  style: TextStyle(
                    color: Color(0xff716E8C),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    wordSpacing: 1,
                    letterSpacing: .8,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.search,
            size: 30,
            color: Colors.grey,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.message_outlined,
            size: 30,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class _Histories extends StatelessWidget {
  const _Histories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 112,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        children: [
          _AddHistory(),
          _UserHistory(
            name: 'Fernanda',
            photo: 'user_history.jpg',
          ),
          _UserHistory(
            name: 'James',
            photo: 'user_history.jpg',
          ),
          _UserHistory(
            name: 'Estefanie',
            photo: 'user_history.jpg',
          ),
          _UserHistory(
            name: 'Hector',
            photo: 'user_history.jpg',
          ),
          _UserHistory(
            name: 'Miguel',
            photo: 'user_history.jpg',
          ),
        ],
      ),
    );
  }
}

class _AddHistory extends StatelessWidget {
  const _AddHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          margin: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Color(0xff2C52B2),
              width: 1.5,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Color(0xff2C52B2),
              size: 25,
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Crear historia',
          style: TextStyle(
            color: Color(0xff203556),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _UserHistory extends StatelessWidget {
  const _UserHistory({
    Key? key,
    required this.photo,
    required this.name,
  }) : super(key: key);

  final String photo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/linkedin/images/$photo',
              fit: BoxFit.cover,
              height: 70,
              width: 70,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: TextStyle(
              color: Color(0xff203556),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
