// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Punk {
  int? id;
  String? name;
  String? tagline;
  String? firstBrewed;
  String? description;
  String? imageUrl;
  num? abv;
  num? ibu;
  num? targetFg;
  num? targetOg;
  num? ebc;
  num? srm;
  num? ph;
  num? attenuationLevel;
  List<String>? foodPairing;
  String? brewersTips;
  String? contributedBy;
  Punk({
    this.id,
    this.name,
    this.tagline,
    this.firstBrewed,
    this.description,
    this.imageUrl,
    this.abv,
    this.ibu,
    this.targetFg,
    this.targetOg,
    this.ebc,
    this.srm,
    this.ph,
    this.attenuationLevel,
    this.foodPairing,
    this.brewersTips,
    this.contributedBy,
  });

  Punk copyWith({
    int? id,
    String? name,
    String? tagline,
    String? firstBrewed,
    String? description,
    String? imageUrl,
    num? abv,
    num? ibu,
    num? targetFg,
    num? targetOg,
    num? ebc,
    num? srm,
    num? ph,
    num? attenuationLevel,
    List<String>? foodPairing,
    String? brewersTips,
    String? contributedBy,
  }) {
    return Punk(
      id: id ?? this.id,
      name: name ?? this.name,
      tagline: tagline ?? this.tagline,
      firstBrewed: firstBrewed ?? this.firstBrewed,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      abv: abv ?? this.abv,
      ibu: ibu ?? this.ibu,
      targetFg: targetFg ?? this.targetFg,
      targetOg: targetOg ?? this.targetOg,
      ebc: ebc ?? this.ebc,
      srm: srm ?? this.srm,
      ph: ph ?? this.ph,
      attenuationLevel: attenuationLevel ?? this.attenuationLevel,
      foodPairing: foodPairing ?? this.foodPairing,
      brewersTips: brewersTips ?? this.brewersTips,
      contributedBy: contributedBy ?? this.contributedBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'tagline': tagline,
      'firstBrewed': firstBrewed,
      'description': description,
      'imageUrl': imageUrl,
      'abv': abv,
      'ibu': ibu,
      'targetFg': targetFg,
      'targetOg': targetOg,
      'ebc': ebc,
      'srm': srm,
      'ph': ph,
      'attenuationLevel': attenuationLevel,
      'foodPairing': foodPairing,
      'brewersTips': brewersTips,
      'contributedBy': contributedBy,
    };
  }

  factory Punk.fromMap(Map<String, dynamic> map) {
    return Punk(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      tagline: map['tagline'] != null ? map['tagline'] as String : null,
      firstBrewed:
          map['first_brewed'] != null ? map['first_brewed'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      imageUrl: map['image_url'] != null ? map['image_url'] as String : null,
      abv: map['abv'] != null ? map['abv'] as num : null,
      ibu: map['ibu'] != null ? map['ibu'] as num : null,
      targetFg: map['target_fg'] != null ? map['target_fg'] as num : null,
      targetOg: map['target_og'] != null ? map['target_og'] as num : null,
      ebc: map['ebc'] != null ? map['ebc'] as num : null,
      srm: map['srm'] != null ? map['srm'] as num : null,
      ph: map['ph'] != null ? map['ph'] as num : null,
      attenuationLevel: map['attenuation_level'] != null
          ? map['attenuation_level'] as num
          : null,
      foodPairing: map['food_pairing'].cast<String>(),
      brewersTips:
          map['brewers_tips'] != null ? map['brewers_tips'] as String : null,
      contributedBy: map['contributed_by'] != null
          ? map['contributed_by'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Punk.fromJson(String source) =>
      Punk.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Punk(id: $id, name: $name, tagline: $tagline, firstBrewed: $firstBrewed, description: $description, imageUrl: $imageUrl, abv: $abv, ibu: $ibu, targetFg: $targetFg, targetOg: $targetOg, ebc: $ebc, srm: $srm, ph: $ph, attenuationLevel: $attenuationLevel, foodPairing: $foodPairing, brewersTips: $brewersTips, contributedBy: $contributedBy)';
  }

  @override
  bool operator ==(covariant Punk other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.tagline == tagline &&
        other.firstBrewed == firstBrewed &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.abv == abv &&
        other.ibu == ibu &&
        other.targetFg == targetFg &&
        other.targetOg == targetOg &&
        other.ebc == ebc &&
        other.srm == srm &&
        other.ph == ph &&
        other.attenuationLevel == attenuationLevel &&
        listEquals(other.foodPairing, foodPairing) &&
        other.brewersTips == brewersTips &&
        other.contributedBy == contributedBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        tagline.hashCode ^
        firstBrewed.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        abv.hashCode ^
        ibu.hashCode ^
        targetFg.hashCode ^
        targetOg.hashCode ^
        ebc.hashCode ^
        srm.hashCode ^
        ph.hashCode ^
        attenuationLevel.hashCode ^
        foodPairing.hashCode ^
        brewersTips.hashCode ^
        contributedBy.hashCode;
  }
}
