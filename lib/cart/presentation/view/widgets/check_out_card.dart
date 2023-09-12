import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/core/widgets/default_button.dart';
import 'package:sneakers_store/features/sneakers/Profile/model/usermodel.dart';
import 'package:sneakers_store/features/sneakers/bag/data/model/bag_model.dart';
import 'package:sneakers_store/features/sneakers/bag/view_model/cubit/bag_cubit.dart';
import 'package:sneakers_store/features/sneakers/bag/widgets/emptybagpage.dart';
import 'package:sneakers_store/features/sneakers/main/view/main_page.dart';
import 'package:sneakers_store/screens/payment/controller/payment_controller.dart';
import 'package:sneakers_store/screens/payment/presentation/view/payment_screen.dart';
import 'package:http/http.dart'as http;
import 'package:sneakers_store/translate.dart';
class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  Map<String, dynamic>? paymentIntentData;
  BagDetails _sneakersDetails(List<BagSneaker> sneakers) {
    var bagDetails = BagDetails();
    for (var sneaker in sneakers) {
      bagDetails.totalCount += sneaker.count;
      bagDetails.totalSum += sneaker.price * sneaker.count;
    }
    return bagDetails;
  }
  @override
  void initState() {
    controller=AnimationController(vsync: this);
    controller.addStatusListener((status) async{
      if(status==AnimationStatus.completed){
        Navigator.pop(context);
        controller.reset();
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagCubit, List<BagSneaker>>(
        builder: (context, sneakers) {

          final details = _sneakersDetails(sneakers);


          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 30,
            ),
            // height: 174,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -15),
                  blurRadius: 20,
                  color: Color(0xFFDADADA).withOpacity(0.15),
                )
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 38,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                            "assets/icons/3d-illustration-payment-confirmation-bill.jpg",),
                      ),
                      Spacer(),
                      Text(Translate.AddVoucherCodeText),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: kTextColor,
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "${Translate.TotalText}:\n",
                          children: [
                            TextSpan(
                              text: "\$${details.totalSum}",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 190,
                        child: DefaultButton(
                          text:Translate.CheckOutText,
                          press: () async{
                           await makePayment();
                          Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>MainPage()), (route) => false);
                           setState(() {
                             sneakers.clear();
                           });
                          }


                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }

    );


  }

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent('980', 'USD');
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
          SnackBar(content: Text(Translate.paidsuccessfuly)));
      showDoneDialog();

      //showDoneDialog();

    } on StripeException catch (e) {
      print(e.toString());
      showDialog(context: context,
          builder: (_) => AlertDialog(content: Text(Translate.cancelsucessfuly),));
    }
  }
  void showDoneDialog()=>showDialog(barrierDismissible: false,

      builder: (BuildContext context) {
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('assets/images/129118-done.json',repeat: false,controller: controller,

            onLoaded: (composition){
              controller.duration=composition.duration;
              controller.forward();


            }

            ),
            Text(Translate.paidsuccessfuly,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
          ],
        ),
      );
      }, context: context
    
  );

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

