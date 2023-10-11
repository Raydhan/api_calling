// ignore_for_file: camel_case_types, avoid_print, non_constant_identifier_names
import 'dart:convert';
import 'package:api_calling/Full_Image.dart';
import 'package:api_calling/user_response_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'Information.dart';

void main() {
  runApp(
    const MaterialApp(
      home: api(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class api extends StatefulWidget {
  const api({Key? key}) : super(key: key);

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {
  List<Result> usersList = [];
  bool load = true;

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Call"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: load
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) {
                  final user = usersList[index];
                  final name = user.FullName;
                  // final email = user.email;
                  // final dob = user.dob.date.toString();
                  final location = user.location?.country;
                  // final login = user.login.password;
                  return ListTile(
                    leading: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.transparent,
                              actions: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Img(usersList[index]);
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    height: 280,
                                    width: 280,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "${user.picture?.large}"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      height: 35,
                                      color: Colors.black38,
                                      child: Text(
                                        maxLines: 1,
                                        user.FullName,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                            //   Center(
                            //   child: SizedBox(
                            //     height: 250,
                            //     width: 250,
                            //     child: Image(
                            //       image: NetworkImage("${user.picture?.large}"),
                            //       fit: BoxFit.fill,
                            //     ),
                            //   ),
                            // );
                          },
                        );
                      },
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(user.picture!.large),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    title: Text(name),
                    subtitle: Text("$location"),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return info(usersList[index]);
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  get() async {
    final response = await http.get(
      Uri.parse('https://randomuser.me/api/?results=150'),
    );
    final json = jsonDecode(response.body);
    final result = json['results'] as List<dynamic>;
    final users = result.map((json) {
      return Result.fromJson(json);
    }).toList();
    setState(() {
      usersList = users;
      load = false;
    });
  }
}
