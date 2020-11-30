class TitleFormField {
  final String title;

  TitleFormField(this.title);

  validate() {
    if (title == null || title.isEmpty) {
      throw Exception("Title is required");
    }
  }
}
