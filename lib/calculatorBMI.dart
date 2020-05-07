class CalculatorBMI {
  CalculatorBMI({height, weight}) {
    this.height = height;
    this.weight = weight;
    _bmi = this.weight / ((this.height / 100) * (this.height / 100));
  }

  double height;
  double weight;
  double _bmi;

  double calculateBMI() {
    return _bmi;
  }

  String getResultBMI() {
    if (_bmi > 30)
      return 'Obesidad';
    else if (_bmi > 25)
      return 'Sobrepeso';
    else if (_bmi > 18.5)
      return 'Rango normal';
    else
      return 'Bajo peso';
  }

  String getAdviceBMI() {
    if (_bmi > 30)
      return 'Deberias visitar un nutricionista, tu peso es muy elevado';
    else if (_bmi > 25)
      return 'Tienes un poco de sobrepeso, deberias hacer ejercicio';
    else if (_bmi > 18.5)
      return 'Buen trabajo, tu indice de masa corporal es normal';
    else
      return 'Tu indice de masa corporal es bajo, deberias visitar un nutricionista';
  }
}
