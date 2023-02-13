import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:work_dr/models/UserResponse.dart';
import 'package:work_dr/services/http_service.dart';

import '../models/User.dart';

class SingleUserPage extends StatefulWidget {
  const SingleUserPage({Key? key}) : super(key: key);

  @override
  _SingleUserPageState createState() => _SingleUserPageState();
}

class _SingleUserPageState extends State<SingleUserPage> {
  bool _isLoading = true;
  late HttpService httpService;
  late UserResponse userResponse;
  late User user;
  Future getUser() async {
    print("getUser funtion initail");  // done
    Response response;
    try {
      response = await httpService.getResponse("/api/users/2");
      if (response.statusCode == 200) {
        print("200");
        setState(() {
          userResponse = UserResponse.fromJson(response.data);
          user = userResponse.user;
          _isLoading =false;
        });
        print("userResponse" + userResponse.user.first_name);
      } else {
        print("Something went wrong");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpService = HttpService();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single User"),
      ),
      body: Center(
        child: _isLoading ? CircularProgressIndicator() : Column(
          children: [
            Text(user.email),
          ],
        ),
      ),
    );
  }
}
