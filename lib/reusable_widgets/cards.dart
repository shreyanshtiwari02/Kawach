import 'package:flutter/material.dart';

//edit profile
class edit_profile extends StatelessWidget {
  const edit_profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
      color: Color(0xb3c690d0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: const ListTile(
        leading: Icon(
          Icons.edit_rounded,
          color: Colors.black54,
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.black54,
        ),
      ),
    );
  }
}

// help and support
class help_support extends StatelessWidget {
  const help_support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: const ListTile(
        leading: Icon(Icons.help_outline, color: Colors.black54),
        title: Text(
          'Help & Support',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.black54,
        ),
      ),
    );
  }
}

// settings
class settings extends StatelessWidget {
  const settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: const ListTile(
        leading: Icon(
          Icons.privacy_tip_sharp,
          color: Colors.black54,
        ),
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}

// Invite a friend
class invite extends StatelessWidget {
  const invite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: const ListTile(
        leading: Icon(
          Icons.add_reaction_sharp,
          color: Colors.black54,
        ),
        title: Text(
          'Invite a Friend',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.black54,
        ),
      ),
    );
  }
}

// Logout
class logout extends StatelessWidget {
  const logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: const ListTile(
        leading: Icon(
          Icons.logout,
          color: Colors.black54,
        ),
        title: Text(
          'Logout',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}