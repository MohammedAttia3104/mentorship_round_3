class AnimeCharacter {
  final String name;
  final String imageUrl;
  final String topMovie;
  final String role;
  final String voiceActor;
  final String voiceActorImageUrl;
  final String voiceActorLanguage;
  final String about;


  AnimeCharacter({
    required this.name,
    required this.imageUrl,
    required this.topMovie,
    required this.role,
    required this.voiceActor,
    required this.voiceActorImageUrl,
    required this.voiceActorLanguage,
    required this.about,
  });

  factory AnimeCharacter.fromJson(Map<String, dynamic> json) {
    return AnimeCharacter(
      name: json['name'],
      imageUrl: json['image_url'],
      topMovie: json['top_movie'] ?? 'Unknown',
      role: json['role'] ?? 'Unknown',
      voiceActor: json['voice_actor'] ?? 'Unknown',
      voiceActorImageUrl: json['voice_actor_image_url'] ?? '',
      voiceActorLanguage: json['voice_actor_language'] ?? 'Unknown',
      about: json['about'] ?? 'No description available.',
    );
  }
}