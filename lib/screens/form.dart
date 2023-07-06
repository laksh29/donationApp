import 'package:donationsapp/const.dart';
import 'package:donationsapp/model/button_model.dart';
import 'package:donationsapp/model/dropdown_model.dart';
import 'package:donationsapp/model/form_model.dart';
import 'package:donationsapp/providers/dropdown_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'payment.dart';

class DonationForm extends ConsumerWidget {
  const DonationForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final donationForm = ref.read(donationFormProvider);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Full Name'),
                onChanged: (value) => donationForm.name = value,
              ),
              buildHeight(15.0),
              TextField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                onChanged: (value) => donationForm.number = value,
              ),
              buildHeight(15.0),
              TextField(
                decoration: const InputDecoration(labelText: 'Donation Amount'),
                onChanged: (value) => donationForm.donationAmt = value,
              ),
              buildHeight(15.0),
              const DropdownModel(),
              buildHeight(30.0),
              ContainerButton(
                  text: "Submit",
                  onTap: () {
                    print(
                        "Name - ${donationForm.name} \nPhone Number - ${donationForm.number} \nDonation Amount - ${donationForm.donationAmt} \nPlace - ${ref.watch(dropdownChangeProvider).selectedCat}");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Payments()));
                  })
            ],
          ),
        ),
      )),
    );
  }
}
