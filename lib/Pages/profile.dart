import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/Pages/Lenders/lendees_info.dart';
import 'package:my_tasks/Pages/Lenders/people_detail.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Who Owes me'),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                trailing: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PeopleDetails()));
                  },
                ),
              ),
            ),
            ListTile(
              title: Text('Name'),
              trailing: Text('Amount'),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TheirInfo()),
                  );
                },
                title: Text('Mama Bria'),
                trailing: Text('570/-'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                title: Text('Julie'),
                trailing: Text('230/-'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                title: Text('Katana tim'),
                trailing: Text('170/-'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                title: Text('Wa Njoki'),
                trailing: Text('720/-'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                title: Text('Silo Silo'),
                trailing: Text('145/-'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
