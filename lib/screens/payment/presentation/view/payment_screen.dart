
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import'package:http/http.dart'as http;
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stripe Payment"), centerTitle: true,
        ),
        body: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                await makePayment();
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.green
                ),
                child: Center(
                  child: Text("Pay"),
                ),
              ),
            )
          ],

        )
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent('20', 'USD');
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntentData!['client_secret'],
              applePay: true,
              googlePay: true,
              style: ThemeMode.dark,
              merchantCountryCode: 'US',
              merchantDisplayName: 'Fady'
          ));
      displayPaymentSheet();
    }

    catch (e) {
      print('exception' + e.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet(
          parameters: PresentPaymentSheetParameters(
              clientSecret: paymentIntentData!['client_secret'],
              confirmPayment: true)
      );
      setState(() {
        paymentIntentData = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Paid Successfuly ")));
    } on StripeException catch (e) {
      print(e.toString());
      showDialog(context: context,
          builder: (_) => AlertDialog(content: Text("Cancelled"),));
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic>body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body, headers: {
        'Authorization': 'Bearer sk_test_51N8BAnGWTAOnxPUSkXSsF53ia9p1pmiddAIAFSR9rgNMjzElwnM4gTNXqlLRbbGF8fut9A5IVtA3CV4Go9LDGLAK00fpNDnrIc',
        'Content-Type': 'application/x-www-form-urlencoded'
      }
      );
      return jsonDecode(response.body.toString());
    }
    catch (e) {
      print('exception' + e.toString());
    }
  }

  calculateAmount(String amount) {
    final price = int.parse(amount) * 100;
    return price.toString();
  }
}

