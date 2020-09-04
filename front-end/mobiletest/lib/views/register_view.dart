import 'package:flutter/material.dart';
import 'package:mobiletest/viewmodels/register_viewmodel.dart';
import 'package:stacked/stacked.dart';

class RegisterView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        viewModelBuilder: () => RegisterViewModel(),
        onModelReady: (model) => null,
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text("Register"),
              ),
              body: Padding(
                padding: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: model.etUsername,
                        decoration:
                            InputDecoration(hintText: "Masukkan Username"),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: model.etPassword,
                        obscureText: true,
                        decoration:
                            InputDecoration(hintText: "Masukkan Password"),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: model.etRepeatPassword,
                        obscureText: true,
                        decoration:
                            InputDecoration(hintText: "Ulangi Password"),
                      ),
                      SizedBox(height: 30.0),
                      RaisedButton(
                        color: Colors.redAccent,
                        onPressed: () {
                          model.createUser();
                        },
                        //Sudah login tampil Halo username, waktu login anda time
                        child: model.isBusy ? CircularProgressIndicator() : Text("Register",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
