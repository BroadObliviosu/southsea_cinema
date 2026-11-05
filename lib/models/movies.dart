class Movie {
  final String id; //final means value cant be reassigned
  final String title;
  final String synopsis;
  final String ageRating;
  final String runtime;
  final String screeningTime;
  final double ticketPrice;
  final String posterImagePath;

  const Movie({
    required this.id,
    required this.title,
    required this.synopsis,
    required this.ageRating,
    required this.runtime,
    required this.screeningTime,
    required this.ticketPrice,
    required this.posterImagePath,
  });

  String get formattedPrice => '£${ticketPrice.toStringAsFixed(2)}'; //getter

  factory Movie.fromJson(Map<String, dynamic> json) {
    final String id = json['id'] as String;
    final String title = json['title'] as String;
    final String synopsis = json['synopsis'] as String;
    final String ageRating = json['ageRating'] as String;
    final String runtime = json['runtime'] as String;
    final String screeningTime = json['screeningTime'] as String;
    final double ticketPrice = (json['ticketPrice'] as num).toDouble();
    final String posterImagePath = json['posterImagePath'] as String;

    return Movie(
      id: id,
      title: title,
      synopsis: synopsis,
      ageRating: ageRating,
      runtime: runtime,
      screeningTime: screeningTime,
      ticketPrice: ticketPrice,
      posterImagePath: posterImagePath,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'synopsis': synopsis,
      'ageRating': ageRating,
      'runtime': runtime,
      'screeningTime': screeningTime,
      'ticketPrice': ticketPrice,
      'posterImagePath': posterImagePath,
    };
  }
}

// final String id = json['id'] as String;
// final String name = json['name'] as String;
// final String description = json['description'] as String;
// final num priceNumber = json['price'] as num;
// final double price = priceNumber.toDouble();
// final String imagePath = json['imagePath'] as String;
