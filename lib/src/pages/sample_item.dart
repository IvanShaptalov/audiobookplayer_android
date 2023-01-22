class AudiobookItem {
  AudiobookItem(this.id, this.title, this.parent, this.path);//, this.duration);
  String title;
  String id;
  AudiobookPlaylistItem parent;
  String path;
  // Duration duration;
}


class AudiobookPlaylistItem {
  AudiobookPlaylistItem(this.id, this.title, this.parts);

  int id;
  String title;
  bool get hasParts {
    if (parts == null){
      return false;
    }
    else{
      return parts!.isNotEmpty; //check that audiobook has parts

    }
  }
  List<AudiobookItem>? parts;
}

class Achievement {
  Achievement(this.id, this.title, this.description, this.done, this.lvl);

  int id;
  String title;
  String description;
  bool done;
  int lvl;

}