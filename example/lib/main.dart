import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foursquare_oauth/foursquare_oauth.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _message;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    String accessToken;

    try {
      accessToken = await FoursquareOAuth.authenticate(
        'FOURSQUARE_CLIENT_ID',
        'FOURSQUARE_CLIENT_SECRET');
    } on PlatformException {
      setState(() {
        _message = 'Error!';
      });
    }

    if (!mounted) return;

    http.get('https://api.foursquare.com/v2/users/self?v=20190101&oauth_token=' + accessToken)
      .then((response) {
         Map user = json.decode(response.body)['response']['user'];
         setState(() {
           _message = 'Hello, ${user['firstName']} ${user['lastName']}!';
         });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Foursquare OAuth for Flutter'),
        ),
        body: Center(
          child: Text('$_message\n'),
        ),
      ),
    );
  }
}
