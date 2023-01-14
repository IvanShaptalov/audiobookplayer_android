class AudiobookItem {
  AudiobookItem(this.id, this.title, this.parent);
  String title;
  int id;
  AudiobookPlaylistItem parent;
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