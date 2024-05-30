class RelojModel {
  String shora = '';
  String sminutos = '';
  int hora = 0;
  int min = 0;
  int dia = 0;
  int mes = 0;
  int year = 0;
  String ampm = '';
  int diaweek = 1;
//   Timer _timer;
  List dias = [
    'Lunes',
    'Martes',
    'Miércoles',
    'Jueves',
    'Viernes',
    'Sábado',
    'Domingo'
  ];
  List meses = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];

  RelojModel() {
    hora = DateTime.now().hour;
    min = DateTime.now().minute;
    dia = DateTime.now().day;
    mes = DateTime.now().month;
    year = DateTime.now().year;
    diaweek = DateTime.now().weekday;

    sminutos = min.toString();
    ampm = 'am';

    if (hora > 12) {
      ampm = 'pm';
      hora = hora - 12;
    }
    if (hora < 10) {
      shora = '0' + hora.toString();
    } else {
      shora = hora.toString();
    }
    if (min < 10) {
      sminutos = '0' + min.toString();
    } else {
      sminutos = min.toString();
    }
  }
}
