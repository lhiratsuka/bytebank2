class ClasseContact {
  final int id;
  final String name;
  final int accountNumber;

  ClasseContact(this.id, this.name, this.accountNumber);

  @override
  String toString() {
    return '{id: $id, name: $name, accountNumber: $accountNumber}';
  }
}
