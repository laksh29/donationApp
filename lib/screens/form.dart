import 'package:donationsapp/const.dart';
import 'package:donationsapp/model/button_model.dart';
import 'package:donationsapp/model/dropdown_model.dart';
import 'package:donationsapp/model/form_model.dart';
import 'package:donationsapp/providers/dropdown_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/validate_model.dart';
import 'payment.dart';

class DonationForm extends ConsumerWidget {
  const DonationForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final donationForm = ref.read(donationFormProvider);
    final _formKey = GlobalKey<FormState>();
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
            key: _formKey,
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
                Center(
                  child: ContainerButton(
                      text: "Submit",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          print(
                              "Name - ${donationForm.name} \nPhone Number - ${donationForm.number} \nDonation Amount - ${donationForm.donationAmt} \nPlace - ${ref.watch(dropdownChangeProvider).selectedCat}");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Payments()));
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
