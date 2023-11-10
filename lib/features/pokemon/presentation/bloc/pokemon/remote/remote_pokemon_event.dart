abstract class RemotePokemonEvent{
  const RemotePokemonEvent();
}

class GetPokemon extends RemotePokemonEvent{
  const GetPokemon();
}

class GetPokemonDetail extends RemotePokemonEvent{
  final int data;
  const GetPokemonDetail(this.data);
}