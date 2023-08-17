import 'package:donationsapp/const.dart';
import 'package:donationsapp/model/button_model.dart';
import 'package:donationsapp/model/dropdown_model.dart';
import 'package:donationsapp/model/form_model.dart';
import 'package:donationsapp/providers/dropdown_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../Services/firestore.dart';
import '../model/validate_model.dart';
import 'bottom_nav.dart';

class DonationForm extends ConsumerWidget {
  const DonationForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handlePaymentErrorResponse(PaymentFailureResponse response) {
      /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
      showAlertDialog(context, "Payment Failed", "${response.message}");
    }

    void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
      /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
      showAlertDialog(
          context, "Payment Successful", "Payment ID: ${response.paymentId}");
    }

    void handleExternalWalletSelected(ExternalWalletResponse response) {
      showAlertDialog(
          context, "External Wallet Selected", "${response.walletName}");
    }

    final donationForm = ref.read(donationFormProvider);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Donation Form"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                  onChanged: (value) => donationForm.name = value,
                ),
                buildHeight(15.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  onChanged: (value) => donationForm.number = value,
                  validator: (value) {
                    if (!isPhoneNumber(donationForm.number)) {
                      return "Enter a 10 digit mobile number";
                    }
                    return null;
                  },
                ),
                buildHeight(15.0),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Donation Amount'),
                  onChanged: (value) => donationForm.donationAmt = value,
                  validator: (value) {
                    if (!isDonationAmt(donationForm.donationAmt)) {
                      return "A min donation of 100 is required.";
                    }
                    return null;
                  },
                ),
                buildHeight(20.0),
                const DropdownModel(),
                buildHeight(30.0),
                // submit button
                Center(
                  child: ContainerButton(
                      text: "Proceed to Payment",
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          if (isDropdownSelected(
                              ref.watch(dropdownChangeProvider).selectedCat)) {
                            final donationPlace =
                                ref.watch(dropdownChangeProvider).selectedCat;
                            donarDetails(
                              name: donationForm.name,
                              phoneNumber: donationForm.number,
                              // address:
                              donationAmount: donationForm.donationAmt,
                              donationPlace: donationPlace,
                              photoURL: donationForm.photoURL,
                            );
                            print(
                                "Name - ${donationForm.name} \nPhone Number - ${donationForm.number} \nDonation Amount - ${donationForm.donationAmt} \nPlace - $donationPlace");
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const BottomNav(),
                            //     ),
                            //     (route) => false);
                            Razorpay razorpay = Razorpay();
                            var options = {
                              // "key": "kYLuIIxr4OzboCK22U8EdHwC",
                              "key": "rzp_live_ILgsfZCZoFIKMb",
                              "amount": int.parse(donationForm.donationAmt),
                              "name": "Daan Dharam",
                              "description": "Donation to $donationPlace",
                              "retry": {
                                "enabled": true,
                                'max_count': 1,
                              },
                              "send_sms_hash": true,
                              'prefill': {
                                'contact': donationForm.number,
                                'email': 'lakshjain515@gmail.com',
                              },
                              'external': {
                                'wallets': ['paytm']
                              },
                            };

                            razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                                handlePaymentErrorResponse);
                            razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                                handlePaymentSuccessResponse);
                            razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                                handleExternalWalletSelected);

                            razorpay.open(options);
                          } else {
                            SnackBar snackBar = const SnackBar(
                                content: Text(
                                    "Please select a place you want to make the donation to"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      }),
                ),
                buildHeight(10.0),
                Center(
                  child: Text(
                    "Do Not Make Any Paymets!\nIt is a trial session to check the flow",
                    style: GoogleFonts.poppins(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

void showAlertDialog(BuildContext context, String title, String message) {
  // set up the buttons
  Widget continueButton = ElevatedButton(
    child: const Text("Continue"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
