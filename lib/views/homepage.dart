import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentError);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": 'rzp_test_wb2Z8R9IaEqprP',
      "amount": num.parse(textEditingController.text) * 100,
      "name": "Dear Donor",
      "description": "When one gives, two get happy",
      "prefill": {
        "contact": " ",
        "email": " ",
      },
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print('Payment Successful');
  }

  void handlerExternalWallet() {
    print('External Wallet');
  }

  void handlerPaymentError() {
    print('Payment Error');
  }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      title: Text("SimPay"),
        leading: Icon(
          Icons.menu,
        ),


        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Logout', 'Settings'}.map((String choice) {
                  return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                            );
                             }
                             )
                        .toList();
                  },
               ),
            ],

       ),


      body: Container(
        width: 450,
        height: 1000,
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          image: const DecorationImage(
            image: NetworkImage('https://images.pexels.com/photos/4467127/pexels-photo-4467127.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            fit: BoxFit.cover,
          ),
        ),


        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            TextField(
              cursorColor: Colors.red,
              controller: textEditingController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                                 ),
                  enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                                  ),
                  hintText: "   Amount to Pay..."

              ),

            ),
            SizedBox(height: 12,),
            RaisedButton(
              color: Colors.deepOrange,
              child: Text("Donate", style: TextStyle(
                  color: Colors.white
              ),),
              onPressed: () {
                openCheckout();
              },
            )
          ],
        ),
      ),
    );
  }
}