class CondationLangage {


 ///Category
  static String? categorey( String newValue) {
    String? _categorie_select;
    if (newValue == "Appartements" ||
        newValue == "Apartments" ||
        newValue == "شقق") {
      _categorie_select = "Apartments";
    } else if (newValue == "Chambre" ||
        newValue == "Rooms" ||
        newValue == "غرفة") {
      _categorie_select = "rooms";
    } else if (newValue == "Maison" ||
        newValue == "House" ||
        newValue == "منزل") {
      _categorie_select = "house";
    } else if (newValue == "Villa" ||
        newValue == "Villa" ||
        newValue == "فيلا") {
      _categorie_select = "villa";
    } else if (newValue == "Riad" || newValue == "Riad" || newValue == "رياض") {
      _categorie_select = "riad";
    } else if (newValue == "Commercial" ||
        newValue == "Commercial" ||
        newValue == "محل تجاري") {
      _categorie_select = "commercialSpace";
    } else if (newValue == "Bureau" ||
        newValue == "Office" ||
        newValue == "مكتب") {
      _categorie_select = "office";
    } else if (newValue == "Terre" || newValue == "Land" || newValue == "أرض") {
      _categorie_select = "land";
    } else if (newValue == "fermes" ||
        newValue == "Farms" ||
        newValue == "مزارع") {
      _categorie_select = "farm";
    }
    return _categorie_select;
  }

  static String? categorey_put(String _categorie) {
    String? _categorie_select;
    if (_categorie=="Apartments") {
      _categorie_select = "Appartements";
    }
    else if (_categorie=="Office Space") {
      _categorie_select = "Bureau";
     }else if (_categorie=="Land") {
      _categorie_select = "Terre";
     }else if (_categorie=="Riads") {
      _categorie_select = "Riad";
     }else if (_categorie=="Villas") {
      _categorie_select = "Villa";
     }else if (_categorie=="Houses") {
      _categorie_select = "Maison";
     }
    return _categorie_select;
  }
  ///Statut
    static String status(String newValue){
var _statut;
      if(newValue=="New"||newValue=="Neuf"||newValue=="جديد") {
        _statut="new";
      }else if(newValue=="good"||newValue=="Bon état"||newValue=="بحالة جيدة"){
        _statut="good";
      }else if(newValue=="good"||newValue=="A besoin de réparation"||newValue=="يتطلب الصيانة"){
        _statut="needRepair";
      }
    return _statut;
    }

    static String? status_put(String status){
 var _statut;
      if(status=="new") {
        _statut="Neuf";
      }else if(status=="good"){
        _statut="Bon état";
      }else if(status=="needRepair"){
        _statut="A besoin de réparation";
      }else{
        return null;
      }
    return _statut;
    }

    ///age
  static String age(String newValue){
    var _age_select;
    if (newValue == "Moins de 1 an" ||
        newValue == "Less than 1 year" ||
        newValue == 'أقل من 1 سنة') {

      _age_select = "L1";
    } else if (newValue == "1 à 5 ans" ||
        newValue == "1 to 5 years old" ||
        newValue == 'من 1 إلى 5 سنوات') {
      _age_select = "F1T5";
    } else if (newValue == "5 à 10 ans" ||
        newValue == "5 to 10 years old" ||
        newValue == 'من 5 إلى 10 سنوات') {
      _age_select = "F5T10";
    } else if (newValue == "10 à 20 ans" ||
        newValue == "10 to 20 years old" ||
        newValue == 'من 10 إلى 20 سنة') {
      _age_select = "F10T20";
    } else if (newValue == "20 à 30 ans" ||
        newValue == "20 to 30 years old" ||
        newValue == 'من 20 إلى 30 سنة') {
      _age_select = "T20F30";
    } else if (newValue == "30 à 50 ans" ||
        newValue == "30 to 50 years old" ||
        newValue == 'من 30 إلى 50 سنة') {
      _age_select = "T30F50";
    } else if (newValue == "50 à 70 ans" ||
        newValue == "50 to 70 years old" ||
        newValue == 'من 50 إلى 70 سنة') {
      _age_select = "T50F70";
    } else if (newValue == "70 à 100 ans" ||
        newValue == "70 to 100 years old" ||
        newValue == 'من 70 إلى 100 سنة') {
      _age_select = "F70T100";
    } else if (newValue == "Plus de 100 ans" ||
        newValue == "Over 100 years old" ||
        newValue == 'أكثر من 100 عام') {
      _age_select = "G100";
    }

    return _age_select;
  }

  static String age_put(String age){
    var _age;
    if(age=="L1") {
      _age="Moins de 1 an";
    }else if(age=="F1T5"){
      _age="1 à 5 ans";
    }
    else if(age=="F5T10"){
      _age="5 à 1 ans";
    }else if(age=="F10T20"){
      _age="10 à 20 ans";
    }else if(age=="F20T30"){
      _age="20 à 30 ans";
    }else if(age=="T30F50"){
      _age="30 à 50 ans";
    }else if(age=="T50F70"){
      _age="50 à 70 ans";
    }
    else if(age=="F70T100"){
      _age="70 à 100 ans";
    }else if(age=="G100"){
      _age="Plus de 100 ans";
    }
    return _age;
  }

}
