import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/Pages/Lenders/people_detail.dart';

class MyProfile extends StatefulWidget {
  final String userId;

  const MyProfile({Key key, this.userId}) : super(key: key);
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Who Owes me'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PeopleDetails()),
            );
          },
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Please click on the button below to a new user',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'When a user pays, click on their name to get the green tick.',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return ListView(
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      final total = (data['items'] as List)
                          .map((e) => double.parse(e['price'] ?? '0'))
                          .reduce((v, e) => v + e);

                      print(total);
                      return ListTile(
                        // updating users data
                        onTap: () async {
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(document.id)
                              .update({'is_paid': true})
                              .then((value) => print("User paid"))
                              .catchError((error) =>
                                  print("Failed to update user: $error"));
                        },
                        title: Text(data['name']),
                        subtitle: Text(data['phone']),
                        leading: (data['is_paid'] as bool)
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                        trailing: Text("$total"),
                        // trailing: Text(data['items']),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
