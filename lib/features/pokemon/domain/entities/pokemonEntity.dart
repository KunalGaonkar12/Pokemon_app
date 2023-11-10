class PokemonEntity {
 //  final String? name;
 //  final String? id;
 //  final String? imageUrl;
 //  final String? xdescription;
 //  final String? ydescription;
 //  final String? height;
 //  final String? category;
 //  final String? weight;
 //  final List<String>? typeofPokemon;
 //  final List<String>? weaknesses;
 //  final List<String>? evolutions;
 //  final List<String>? abilities;
 //  final int? hp;
 //  final  int? attack;
 //  final int? defense;
 //  final int? specialAttack;
 //  final int? specialDefense;
 //  final int? speed;
 //  final int? total;
 //  final  String? malePercentage;
 //  final String? femalePercentage;
 //  final int? genderless;
 //  final String? cycles;
 //  final String? eggGroups;
 //  final String? evolvedFrom;
 //  final String? reason;
 //  final String? baseExp;
 //
 // const  PokemonEntity(
 //      {this.name,
 //        this.id,
 //        this.imageUrl,
 //        this.xdescription,
 //        this.ydescription,
 //        this.height,
 //        this.category,
 //        this.weight,
 //        this.typeofPokemon,
 //        this.weaknesses,
 //        this.evolutions,
 //        this.abilities,
 //        this.hp,
 //        this.attack,
 //        this.defense,
 //        this.specialAttack,
 //        this.specialDefense,
 //        this.speed,
 //        this.total,
 //        this.malePercentage,
 //        this.femalePercentage,
 //        this.genderless,
 //        this.cycles,
 //        this.eggGroups,
 //        this.evolvedFrom,
 //        this.reason,
 //        this.baseExp});

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.weight,
    required this.height,
    required this.generation,
    required this.imageUrl,
    required this.type,
    required this.abilities,
    required this.baseExperience,
    required this.stats,
  });

  final int id;
  final String name;
  final String weight;
  final String height;
  final String generation;
  final String imageUrl;
  final List<String> type; // Assuming a Pokémon can have multiple types
  final List<String> abilities; // Assuming a Pokémon can have multiple abilities
  final int baseExperience;
  final Map<String, int> stats;

}
