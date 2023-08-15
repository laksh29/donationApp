import 'package:donationsapp/const.dart';
import 'package:donationsapp/model/button_model.dart';
import 'package:donationsapp/model/dropdown_model.dart';
import 'package:donationsapp/model/form_model.dart';
import 'package:donationsapp/providers/dropdown_providers.dart';
import 'package:donationsapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Services/firestore.dart';
import '../model/validate_model.dart';
import 'bottom_nav.dart';

class DonationForm extends ConsumerWidget {
  const DonationForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BottomNav(),
                                ),
                                (route) => false);
                          } else {
                            SnackBar snackBar = const SnackBar(
                                content: Text(
                                    "Please select a place you want to make the donation to"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
