import 'package:flutter/material.dart';
import 'package:mobiletest/viewmodels/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onModelReady: (model) => model.initial(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text("Login"),
              ),
              body: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: "Masukkan Username"),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: "Masukkan Password"),
                    ),
                    SizedBox(height: 10.0),
                    RaisedButton(
                      color: Colors.green,
                      onPressed: () {},
                      //Sudah login tampil Halo username, waktu login anda time
                      child: Text("Login"),
                    ),
                    SizedBox(height: 10.0),
                    RaisedButton(
                      color: Colors.redAccent,
                      onPressed: () {},
                      //Sudah login tampil Halo username, waktu login anda time
                      child: Text("Register"),
                    ),
                  ],
                ),
              ),
            ));
  }
}
