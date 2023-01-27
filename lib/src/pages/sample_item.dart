class AudiobookItem {
  AudiobookItem(this.id, this.title, this.parent, this.path);
  String title;
  String id;
  AudiobookPlaylistItem parent;
  String path;

  static AudiobookItem getAudiobookItem() {
    var playlist = AudiobookPlaylistItem(-1, 'pure playlist', null);
    return AudiobookItem('dalskjfhnjk', 'red-indian-music', playlist,
        'assets/audio/red-indian-music.mp3');
  }

  @override
  int get hashCode {
    return toString().hashCode;
  }


  @override
  bool operator ==(Object other) {
    return toString() == other.toString();
  }

  @override
  String toString() {
    return "$id $title $path";
  }
}

class AudiobookPlaylistItem {
  AudiobookPlaylistItem(this.id, this.title, this.parts);

  int id;
  String title;
  bool get hasParts {
    if (parts == null) {
      return false;
    } else {
      return parts!.isNotEmpty; //check that audiobook has parts

    }
  }

  @override
  int get hashCode {
    return toString().hashCode;
  }

  List<AudiobookItem>? parts;

  @override
  bool operator ==(Object other) {
    return toString() == other.toString();
  }

  @override
  String toString() {
    return "$id $title has parts: $hasParts";
  }
}

class Achievement {
  Achievement(this.id, this.title, this.description, this.done, this.lvl);

  int id;
  String title;
  String description;
  bool done;
  int lvl;
}
