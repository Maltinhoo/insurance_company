enum InsuranceService {
  automobile('Automóvel', 'seguro-auto.png'),
  residential('Residencia', 'residential'),
  life('Vida', 'life'),
  motorcycle('Moto', 'seguro-auto.png'),
  personalAccidents('Acidentes Pessoais', 'seguro-acidentes.png'),
  enterprise('Empresa', 'seguro-empresarial.png');

  final String label;
  final String icon;

  const InsuranceService(this.label, this.icon);
}
