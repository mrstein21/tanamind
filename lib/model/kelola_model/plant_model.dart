class PlantModel {
  int id;
  int plantId;
  String image;
  String tglTanam;
  String tglSekarang;
  int dateProgress;
  int dayFinish;
  MasterPlan masterPlan;

  PlantModel(
      {this.id,
      this.plantId,
      this.image,
      this.masterPlan,
      this.dateProgress,
      this.dayFinish,
      this.tglSekarang,
      this.tglTanam});

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
        id: json['id'],
        image: json['image'],
        plantId: json['plant_id'],
        tglTanam: json['tgl_tanam'],
        tglSekarang: json['tgl_sekarang'],
        dateProgress: json['days_to_grow'],
        dayFinish: json['days_till_next_stage'],
        masterPlan: MasterPlan.fromJson(json['master_plant']));
  }
}

class MasterPlan {
  int id;
  String name;
  int type;
  String size;
  String description;

  MasterPlan({this.id, this.description, this.size, this.name, this.type});

  factory MasterPlan.fromJson(Map<String, dynamic> json) {
    return MasterPlan(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        size: json['size'],
        type: json['type']);
  }
}
