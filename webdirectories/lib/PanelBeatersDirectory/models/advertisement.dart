class AdvertisementModel {
  AdvertisementModel({
    required this.dateAdded,
    this.dateUpdated,
    required this.immageDescription,
    required this.immageFile,
    required this.immageTitle,
    required this.listingsId,
    this.membersId,
    required this.specialsOrder,
  });

  final String dateAdded;
  final String? dateUpdated;
  final String immageDescription;
  final String? immageFile;
  final String immageTitle;
  final int listingsId;
  final int? membersId;
  final int specialsOrder;
}
