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
                      controller: model.etUsername,
                      decoration:
                          InputDecoration(hintText: "Masukkan Username"),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: true,
                      controller: model.etPassword,
                      decoration:
                          InputDecoration(hintText: "Masukkan Password"),
                    ),
                    SizedBox(height: 30.0),
                    model.isBusy
                        ? CircularProgressIndicator()
                        : RaisedButton(
                            color: Colors.green,
                            onPressed: () {
                              model.loginGo(context);
                            },
                            //Sudah login tampil Halo username, waktu login anda time
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                    SizedBox(height: 10.0),
                    RaisedButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        model.navigateRegister(context);
                      },
                      //Sudah login tampil Halo username, waktu login anda time
                      child: Text("Register",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ));
  }
}
