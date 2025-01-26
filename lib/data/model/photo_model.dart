class ImageModel {
  final String imageUrl;
  final String caption;

  ImageModel({required this.imageUrl, required this.caption});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      imageUrl: json['src']['medium'] as String,  // Fetch the medium-sized image
      caption: json['alt'] as String,  // Use the "alt" field as a caption
    );
  }
}
