class ProductionCompanyModel {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  ProductionCompanyModel(this.id, this.name, this.logoPath, this.originCountry);

  factory ProductionCompanyModel.fromJson(dynamic json) {

    return ProductionCompanyModel(
        json['id'],
        json['name'] ?? 'Unavailable name',
        json['logo_path'] ?? 'Unavailable logo path',
        json['origin_country'] ?? 'Unavailable origin country'
    );
  }
}
