class DrugList {
  String? drug;

  DrugList(this.drug);

  DrugList.fromList(List<List<dynamic>>? items) : this(items![0][0]);

  @override
  String toString() {
    return 'DrugList{id: $drug}';
  }
}