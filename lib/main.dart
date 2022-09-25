import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payments_app/blocs/token_fetch/token_bloc.dart';
import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:payments_app/repository/api_repository.dart';

import 'Widgets/card_custom.dart';
import 'blocs/token_fetch/token_event.dart';
import 'blocs/token_fetch/token_state.dart';

import 'dart:math';

void main() {
  TextStyle val = GoogleFonts.montserrat();
  runApp(MaterialApp(
    title: 'Pay-U',
    theme: ThemeData(
        textTheme: TextTheme(
      headline1: TextStyle(
          fontFamily: val.fontFamily,
          fontSize: 29,
          fontStyle: val.fontStyle,
          fontWeight: FontWeight.bold,
          fontFeatures: val.fontFeatures),
    )),
    home: RepositoryProvider(
      create: (context) => ApiRepository(),
      child: HomeScreen(),
    ),
  ));
}

class HomeScreen extends StatelessWidget {
  final TextEditingController _orderAmount = TextEditingController();
  final id = Random(20000).nextInt(20000);

  HomeScreen({Key? key}) : super(key: key);

  void _tapHandler(BuildContext context) async {
    var orderAmount = int.parse(_orderAmount.text);
    BlocProvider.of<TokenBloc>(context)
        .add(GetTokenData(orderId: id, orderAmount: orderAmount));
    // ApiRepository repo = new ApiRepository();
    // var response = await repo.fetchToken();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) =>
          TokenBloc(apiRepository: RepositoryProvider.of<ApiRepository>(ctx)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFE0FCEB),
          key: scaffoldKey,
          body: BlocListener<TokenBloc, TokenState>(
            listener: (ctx, state) {
              if (state is TokenLoaded) {
                var inputParams = {
                  "orderId": id,
                  "orderAmount": _orderAmount.text,
                  "orderCurrency": "INR",
                  "tokenData": state.data.cftToken,
                  "appId": "2397888f5fb662ba5b973917c1887932",
                  "customerName": "Francis Handy",
                  "customerPhone": "3434343434",
                  "customerEmail": "suhas.g@cashfree.com",
                  "stage": "TEST",
                  "notifyUrl": "",
                  "orderNote": "optional"
                };

                CashfreePGSDK.doPayment(inputParams)
                    .then((value) => value?.forEach((key, value) {
                          print("$key:$value");
                        }));
              }
            },
            child: BlocBuilder<TokenBloc, TokenState>(
              builder: (context, state) {
                if (state is TokenLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TokenError) {
                  return const Center(child: Text("Error"));
                }
                return buildScreenWidget(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildScreenWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          margin: EdgeInsets.all(27),
            width: double.infinity,
            child: Text(
              "Payment",
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold,fontFamily: GoogleFonts.numans().fontFamily),
              textAlign: TextAlign.left,
            )),
        Container(
          margin: EdgeInsets.all(25),
          width: 400,
          child: CustomCard(
            orderAmount: _orderAmount,
          ),
        ),
        Container(
          padding: EdgeInsets.all(27),
          width: double.infinity,
          height: 110,
          child: ElevatedButton(
            onPressed: () {
              _tapHandler(context);
            },
            style:ElevatedButton.styleFrom(
              primary: Color(0xF02F314B),
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text("Send"),
          ),
        ),
      ]),
    );
  }
}

