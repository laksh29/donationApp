import 'package:flutter_riverpod/flutter_riverpod.dart';

class DonationForm {
  String name = "";
  String number = "";
  String donationAmt = "";
  String photoURL = "";
}

final donationFormProvider = Provider<DonationForm>((ref) => DonationForm());
