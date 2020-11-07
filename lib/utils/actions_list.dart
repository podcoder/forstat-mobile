enum ActionType { edit, delete }

class ActionList {
  final ActionType actionsType;
  final String name;

  ActionList(this.actionsType, this.name);

  static List<ActionList> getActions() {
    return <ActionList>[
      ActionList(ActionType.edit, "Edit"),
      ActionList(ActionType.delete, "Delete"),
    ];
  }
}
