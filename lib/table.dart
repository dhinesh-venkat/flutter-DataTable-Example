import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GenerateTable extends StatefulWidget {
  const GenerateTable({Key key}) : super(key: key);

  static const routeName = '/table';

  @override
  _GenerateTableState createState() => _GenerateTableState();
}

class _GenerateTableState extends State<GenerateTable> {
  List<User> _userList = [];
  fetchUsers() async {
    var data = await http
        .get("http://www.json-generator.com/api/json/get/bPWSZmYYgO?indent=2");
    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var i in jsonData) {
      User user = User(i['name'], i['gender'], i['age'], i['email'],
          i['eyeColor'], i['phone'], i['company']);
      users.add(user);
      print(user.eyeColor);
    }
    print(users.length);
    this.setState(() {
      _userList = users;
    });
  }

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Text(
            "User Details",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(3.0, 3.0),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  )
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text("Name")),
                      DataColumn(label: Text("Gender")),
                      DataColumn(label: Text("Age")),
                      DataColumn(label: Text("Email")),
                      DataColumn(label: Text("EyeColor")),
                      DataColumn(label: Text("Phone")),
                      DataColumn(label: Text("Company")),
                    ],
                    rows: _userList
                        .map(
                          ((val) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(val.name)),
                                  DataCell(Text(val.gender)),
                                  DataCell(Text(val.age.toString())),
                                  DataCell(Text(val.email)),
                                  DataCell(Text(val.eyeColor)),
                                  DataCell(Text(val.phone)),
                                  DataCell(Text(val.company)),
                                ],
                              )),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  final String name;
  final String gender;
  final int age;
  final String email;
  final String eyeColor;
  final String phone;
  final String company;

  User(this.name, this.gender, this.age, this.email, this.eyeColor, this.phone,
      this.company);
}
