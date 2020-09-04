import 'package:flutter/material.dart';
import 'package:mobiletest/configs/shared_preference.dart';
import 'package:mobiletest/viewmodels/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.initial(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text("Mobile Test MKM"),
              ),
              body: Center(
                child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(model.timeString),
                        SizedBox(height: 10.0),
                        model.isBusy
                            ? CircularProgressIndicator()
                            : RaisedButton(
                                onPressed: () {
                                  model.isUserLogin == null
                                      ? Navigator.pushReplacementNamed(
                                          context, '/login')
                                      : print("Sudah login");
                                },
                                //Sudah login tampil Halo username, waktu login anda time
                                child: Text(model.isUserLogin == null
                                    ? "Hello Belum Login"
                                    : "Hello" + UserSharedPreference.getUser().toString()),
                              )
                      ],
                    )),
              ),
            ));
  }
}
