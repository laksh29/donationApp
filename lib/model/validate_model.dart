bool isPhoneNumber(String number) {
  if (number.length > 10 || number.length < 10) {
    return false;
  } else {
    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
    return numericRegex.hasMatch(number);
  }
}

bool isDonationAmt(String donation) {
  try {
    int daan = int.parse(donation);
    if (daan > 99) {
      return true;
    }
  } catch (e) {
    return false;
  }
  return false;
}

bool isDropdownSelected(String? selected) {
  if (selected != null) {
    return true;
  }
  return false;
}
