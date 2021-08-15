import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class PeopleDetails extends StatefulWidget {
  const PeopleDetails();

  @override
  _PeopleDetailsState createState() => _PeopleDetailsState();
}

class _PeopleDetailsState extends State<PeopleDetails> {
  final _formKey = GlobalKey<FormBuilderState>();
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
                    decoration: InputDecoration(
                      labelText: 'Enter a Name',
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderTextField(
                    name: 'Phone',
                    decoration: InputDecoration(
                      labelText: 'Enter phone number',
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.ac_unit),
                    title: Text('mingi'),
                    trailing: Text("100"),
                  ),
                ),
                SizedBox(height: 20,),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.ac_unit),
                    title: Text('salt'),
                    trailing: Text("30"),
                  ),
                ),
                SizedBox(height: 20,),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text('items'),
                  trailing: Text("Price"),
                ),
                SizedBox(height: 20,),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text('items'),
                  trailing: Text("Price"),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  color: Colors.green,
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: MaterialButton(
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
          )
        ],
      ),
    );
  }
}
