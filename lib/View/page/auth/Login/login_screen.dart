import 'package:flutter/material.dart';
import 'package:roya_immobilie/View/page/auth/Login/components/body.dart';


class LoginScreen extends StatelessWidget {
  var property_type;
  var categorie;
  var status;
  var adress;
  var region_id;
  var city_id;
  var ville;
  var quartier;
  var bedrooms;
  var bathrooms;
  var kitchens;
  var apartment;
  var area;
  var price;
  var age;
  var floor;
  var floor_type;
  var title ;
  var description ;
  var phone1;
  var phone2;
  var media;
  var abilities;
  var transaction;


  LoginScreen({
      this.property_type,
      this.categorie,
      this.status,
      this.adress,
      this.region_id,
      this.city_id,
      this.ville,
      this.quartier,
      this.bedrooms,
      this.bathrooms,
      this.kitchens,
      this.apartment,
      this.area,
      this.price,
      this.age,
      this.floor,
      this.floor_type,
      this.title,
      this.description,
      this.phone1,
      this.phone2,
      this.media,
      this.abilities,
      this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(region_id: "1",
          city_id: "8", transaction: "Rent",
          property_type:property_type, status: status,
          adress: adress, quartier: quartier,
          area: area, price: price, age: age,
          floor_type: "appartoment", floor: "4",
          apartment: "1", bedrooms: '2',
          bathrooms: '5', kitchens: '6',
          title: title, description:description,
          phone1: phone1,
          abilities: "2", media: media),
    );
  }
}
