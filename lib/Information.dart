// ignore_for_file: camel_case_types, must_be_immutable, file_names, prefer_const_constructors
import 'package:api_calling/user_response_model.dart';
import 'package:flutter/material.dart';

class info extends StatefulWidget {
  Result user;

  info(this.user, {super.key});

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Information"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 30, bottom: 10),
                height: MediaQuery.of(context).size.height * 0.32,
                width: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: NetworkImage(widget.user.picture?.large ?? ""),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      title: Text(widget.user.FullName),
                    ),
                    ListTile(
                      leading: Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      title: Text(widget.user.email.toString()),
                    ),
                    ListTile(
                      leading: Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      title: Text(widget.user.gender.toString()),
                    ),
                    ListTile(
                      leading: Text(
                        "Phone no",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      title: Text(widget.user.phone.toString()),
                    ),
                    ListTile(
                      leading: Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      title: Text(widget.user.login?.username ?? ""),
                    ),
                    ListTile(
                      leading: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      title: Text(widget.user.login?.password ?? ""),
                    ),
                    ListTile(
                      leading: Text(
                        "Birthdate",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                          "${widget.user.dob?.date.day.toString()}/${widget.user.dob?.date.month.toString()}/${widget.user.dob?.date.year.toString()}"),
                    ),
                    ListTile(
                      leading: Text(
                        "Age",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      title: Text(widget.user.dob?.age.toString() ?? ""),
                    ),
                    ListTile(
                      leading: Text(
                        "City",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      title: Text(widget.user.location?.city ?? ""),
                    ),
                    ListTile(
                      leading: Text(
                        "State",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      title: Text(widget.user.location?.state ?? ""),
                    ),
                    ListTile(
                      leading: Text(
                        "Country",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      title: Text(widget.user.location?.country ?? ""),
                    ),
                    ListTile(
                      leading: Text(
                        "Nat",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      title: Text(widget.user.nat.toString()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
