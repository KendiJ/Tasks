import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class PeopleDetails extends StatefulWidget {
  final String name;
  final int number;
  final String userId;

  const PeopleDetails({this.name, this.number, this.userId});

  @override
  _PeopleDetailsState createState() => _PeopleDetailsState();
}

class _PeopleDetailsState extends State<PeopleDetails> {
  final _formKey = GlobalKey<FormBuilderState>();

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController itemName = TextEditingController();
  TextEditingController itemPrice = TextEditingController();

// Added a collection for users on Firestore.
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  List items = [];

  // this function adds a new user to the users collection
  Future<void> addUser() {
    return users
        .add({
          'name': nameController.text,
          'phone': phoneController.text,
          "is_paid": false,
          "items": items,
        })
        .then((value) => print('User added'))
        .catchError((e) => print("Failed to add user"));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a debtor'),
      ),
      body: Column(
        children: [
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderTextField(
                    name: 'Name',
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Enter a Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderTextField(
                    name: 'Phone',
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'Enter phone number',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        child: Icon(Icons.add),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Add items'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FormBuilderTextField(
                                        name: 'Name',
                                        controller: itemName,
                                        decoration: InputDecoration(
                                          labelText: 'Item name',
                                        ),
                                      ),
                                      FormBuilderTextField(
                                        name: 'Price',
                                        controller: itemPrice,
                                        decoration: InputDecoration(
                                          labelText: 'Item Price',
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [

                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              items.add({
                                                "name": itemName.text,
                                                "price": itemPrice.text

                                              });
                                            });
                                            itemName.clear();
                                            itemPrice.clear();
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Ok"),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ...List.generate(
           items.length,
            (index) =>ListTile(
              leading: Text(items[index]['name']),
              trailing: Text(items[index]['price']),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CupertinoButton(
                    color: Colors.green,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (nameController.value.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Name cannot be empty')));
                        return;
                      }
                      if (phoneController.value.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Number cannot be empty')));
                        return;
                      }

                      addUser();
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: CupertinoButton(
                    color: Colors.red,
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _formKey.currentState.reset();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
