void main() {

    final Map<String, dynamic> pokemon = {
        'name': 'Ditto',
        'hp': 100,
        'isAlive': true,
        'abilities': <String>['impostor'],
        'sprites': {
            'front': 'ditto/front.png',
            'back': 'ditto/back.png'
        }
    };

    for(final key in pokemon.keys) {
        print('$key: ${pokemon[key]}');
    }

    // Sprites

    for(final sprite in pokemon['sprites'].values) {
        print(sprite);
    }

}