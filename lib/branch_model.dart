class BranchModel {
  final int id;
  final String name;
  final bool isVerified;
  final String branchAddress;
  final int cityId;

  BranchModel(
      {this.id, this.name, this.isVerified, this.branchAddress, this.cityId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isVerified': isVerified,
      'branchAddress': branchAddress,
      'cityId': cityId,
    };
  }

  BranchModel.branchFromFireStore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        name = firestore['name'],
        isVerified = firestore['isVerified'],
        branchAddress = firestore['branchAddress'],
        cityId = firestore['cityId'];
}
