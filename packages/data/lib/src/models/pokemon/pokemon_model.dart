import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_model.freezed.dart';

@freezed
class PokemonModel with _$PokemonModel {
  const factory PokemonModel({
    required int id,
    required String name,
    required String weight,
    required String height,
    required String generation,
    required String imageUrl,
    required List<String> type,
    required List<String> abilities,
    required int  baseExperience,
    required Map<String, int>  stats,
  })= _PokemonModel;

  // final int id;
  // final String name;
  // final String weight;
  // final String height;
  // final String generation;
  // final String imageUrl;
  // final List<String> type; // Assuming a Pokémon can have multiple types
  // final List<String>
  //     abilities; // Assuming a Pokémon can have multiple abilities
  // final int baseExperience;
  // final Map<String, int> stats; // e.g., {"speed": 60, "attack": 80}

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonModel &&
        other.id == id &&
        other.name == name &&
        other.weight == weight &&
        other.height == height &&
        other.generation == generation &&
        other.imageUrl == imageUrl &&
        other.type == type &&
        other.abilities == abilities &&
        other.baseExperience == baseExperience &&
        other.stats == stats;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        weight.hashCode ^
        height.hashCode ^
        generation.hashCode ^
        imageUrl.hashCode ^
        type.hashCode ^
        abilities.hashCode ^
        baseExperience.hashCode ^
        stats.hashCode;
  }

  @override
  String toString() {
    return 'PokemonModel(id: $id, name: $name, weight: $weight, height: $height, generation: $generation, imageUrl: $imageUrl, type: $type, abilities: $abilities, baseExperience: $baseExperience, stats: $stats)';
  }
}
