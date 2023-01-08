/// A placeholder class that represents an entity or model.
class SampleItem {
  const SampleItem(this.id, this.title);
  final String title;
  final int id;
}


class AudiobookPlaylistItem {
  const AudiobookPlaylistItem(this.id, this.title, this.hasParts, this.parts);
  final int id;
  final String title;
  final bool hasParts;
  final List<SampleItem> parts;
}