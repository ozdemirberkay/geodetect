import 'package:image_picker/image_picker.dart';

class ImageLocation {
  final double latitute;
  final double longitute;
  final String note;
  final int personCount;
  final XFile photo;

  ImageLocation({
    required this.latitute,
    required this.longitute,
    required this.note,
    required this.personCount,
    required this.photo,
  });

  // JSON'a dönüştürme
  Map<String, dynamic> toJson() => {
        'latitute': latitute,
        'longitute': longitute,
        'note': note,
        'personCount': personCount,
        'photo': photo.path,
      };

  // JSON'dan nesneye dönüştürme
  factory ImageLocation.fromJson(Map<String, dynamic> json) {
    return ImageLocation(
      latitute: json['latitute'],
      longitute: json['longitute'],
      note: json['note'],
      personCount: json['personCount'],
      photo: XFile(json['photo']),
    );
  }
}
