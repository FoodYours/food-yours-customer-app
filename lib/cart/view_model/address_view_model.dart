class AddressViewModel {
  String clientId;
  String address;
  String otherAddress;
  String workAddress;
  // String timestamp;

  AddressViewModel({
    this.clientId = "",
    this.address = "",
    this.otherAddress = "",
    this.workAddress = "",
    // this.timestamp = "",
  });

  AddressViewModel.fromJson(Map<String, dynamic>? json)
      : clientId = json?['clientID'] ?? "",
        address = json?['address'] ?? "",
        otherAddress = json?['otherAddress'] ?? "",
        workAddress = json?['workAddress'] ?? "";
  // timestamp = json?['timestamp'] ?? "";
}
