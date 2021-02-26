import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/main_bloc.dart';
import 'pop_up.dart';
import 'criptor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ToEncrypt(),
        theme: ThemeData(
            primaryColor: Color(0xffF3F5FA),
            backgroundColor: Color(0xffF3F5FA),
            scaffoldBackgroundColor: Color(0xffF3F5FA),
            fontFamily: 'Source Sans Pro',
            appBarTheme: AppBarTheme(
              color: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
            )));
  }
}

class ToEncrypt extends StatelessWidget {
  final inputController = TextEditingController();
  final inputKeyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CriptorBloc(),
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
              color: Color(0xff2A7EFD),
              onPressed: () {},
            ),
            title: Text(
              "Лабораторная #3",
              style: TextStyle(color: Colors.black, fontSize: 19),
            ),
          ),
          body: BlocConsumer<CriptorBloc, CriptorState>(
            builder: (context, state) {
              if (state is CriptorMainState) {
                return SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 15, top: 8),
                          child: Text(
                              "Введите текст который необходимо зашифровать",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold))),
                      Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Color(0xffFFFFFF)),
                              borderRadius: BorderRadius.circular(9.0)),
                          margin: EdgeInsets.only(left: 15, top: 17, right: 21),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 12, top: 16, bottom: 17),
                              child: TextFormField(
                                controller: inputController,
                                decoration:
                                    InputDecoration.collapsed(hintText: ''),
                              ))),
                      Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Color(0xffFFFFFF)),
                              borderRadius: BorderRadius.circular(9.0)),
                          margin: EdgeInsets.only(left: 15, top: 17, right: 21),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 12, top: 16, bottom: 17),
                              child: TextFormField(
                                controller: inputKeyController,
                                decoration: InputDecoration.collapsed(
                                    hintText: 'Введите гамму'),
                              ))),
                      Container(
                          margin: EdgeInsets.only(left: 18, right: 18, top: 21),
                          child: MaterialButton(
                            child: Text(" <-- Зашифровать --> ",
                                style: TextStyle(fontSize: 16)),
                            minWidth: double.infinity,
                            height: 52,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            onPressed: () {
                              match.clear();

                              // keyList.add(randomizer);
                              BlocProvider.of<CriptorBloc>(context).add(CriptIt(
                                  "${inputController.text.replaceAll(new RegExp(r"\s+\b|\b\s"), "")}",
                                  "${inputKeyController.text.replaceAll(new RegExp(r"\s+\b|\b\s"), "")}"));
                            },
                            color: Color(0xff8EB8FF),
                            textColor: Color(0xffF3F5FA),
                          )),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                            "Величина длинны строки 'гамма' должна совпадать с длинной строки которую необходимо зашифровать",
                            style: TextStyle(fontSize: 16)),
                      )
                    ],
                  ),
                );
              }
              return SizedBox();
            },
            listener: (context, state) {
              if (state is LoadingState) {
                return showDialog(
                    context: context,
                    builder: (context) => Center(
                          child: CircularProgressIndicator(),
                        ));
              }
              if (state is CloseLoadingState) {
                Navigator.of(context, rootNavigator: true).pop();
              }
              if (state is PopUpState) {
                popupWindow(state.textafter, context);
              }
            },
            buildWhen: (previous, current) => current is CriptorMainState,
          )),
    );
  }
}
