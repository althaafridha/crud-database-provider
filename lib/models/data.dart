class DataModel {
  String? idData;
  String? title;
  String? description;
  String? idUser;
  String? nama;

  DataModel(
      this.idData, this.title, this.description, this.idUser, this.nama);

  DataModel.fromJson(Map<String, dynamic> json) {
    idData = json['id_data'];
    title = json['title'];
    description = json['description'];
    idUser = json['id_user'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_data'] = idData;
    data['title'] = title;
    data['description'] = description;
    data['id_user'] = idUser;
    data['nama'] = nama;
    return data;
  }
}
