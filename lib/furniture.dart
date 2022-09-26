class Furniture {
  String option;
  String textBox;
  
  Furniture(this.option, this.textBox);
  static List<Furniture> samples = [
    Furniture('Yes', 'Enter your furniture number: '),
    Furniture('No', 'Enter the furniture number close to you')
  ];
}

