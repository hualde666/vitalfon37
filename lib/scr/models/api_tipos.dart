class ApiTipos {
  int? id;
  String tipo; // 1 = grupo app; 2= grupo de contactos; 3= grupo menu principal
  String grupo; // Nombre del grupo
  String nombre; // Nombre del elemento grupo
  ApiTipos(
      {this.id, required this.tipo, required this.grupo, required this.nombre});

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "tipo": this.tipo,
        "grupo": this.grupo,
        "nombre": this.nombre
      };
  factory ApiTipos.fromJson(Map<String, dynamic> json) => ApiTipos(
        id: json["id"],
        tipo: json["tipo"],
        grupo: json["grupo"],
        nombre: json["nombre"],
      );
}
